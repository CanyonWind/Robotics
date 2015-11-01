
/**
 * @file manipulator.hpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Rahul Shome, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "simulation/systems/plants/manipulator.hpp"

#include "prx/simulation/collision_checking/collision_checker.hpp"
#include "prx/utilities/spaces/space.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"

#include <urdf/model.h>
#include <time.h>
#include <iostream>
#include <fstream>
#include <sys/param.h>
#include <kdl_parser/kdl_parser.hpp>
#include <kdl/chainiksolverpos_nr_jl.hpp>
#include <kdl/chainiksolvervel_pinv.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <kdl/chainidsolver_recursive_newton_euler.hpp>

#define IK_ITERATIONS 70
namespace prx
{
    namespace packages
    {
        using namespace util;
        using namespace sim;

        namespace manipulation
        {

            manipulator_t::manipulator_t() : sim::integration_plant_t()
            {
                char* w = std::getenv("PRACSYS_PATH");
                std::string filename(w);
                pracsys_path = filename;
                GRASP_STEP = 1/simulation::simulation_step;
            }
            
            manipulator_t::~manipulator_t()
            {
                state_space->free_point(inter_st);
            }

            void manipulator_t::init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader)
            {
                // sim::kinematic_plant_t::init(reader,template_reader);                

                MAX_IK_STEP = parameters::get_attribute_as<double>("max_ik_step", reader, template_reader, 0.01);
                config_t root_config;
                parameters::initialize<config_t > (&root_config,reader,"root_frame",template_reader,"root_frame");
                double qx,qy,qz,qw;
                double x,y,z;
                root_config.get_orientation().get(qx,qy,qz,qw);
                root_config.get_position(x,y,z);              
                root_frame = KDL::Frame(KDL::Rotation::Quaternion(qx,qy,qz,qw),KDL::Vector(x, y, z));
        
                if( parameters::has_attribute( "urdf_file", reader, template_reader ) )
                {
                    urdf_file_name = parameters::get_attribute_as< std::string >( "urdf_file", reader, template_reader);
                }
                else
                {
                    PRX_FATAL_S("Manipulator_t needs a urdf file!");
                }

                urdf_file_name = input_path +"/"+ urdf_file_name;                
                kdl_tree = new KDL::Tree();
                if (!kdl_parser::treeFromFile(urdf_file_name.c_str(), *kdl_tree))
                  PRX_FATAL_S("Failed to construct kdl tree");
                
                KDL::SegmentMap::const_iterator root_iter = kdl_tree->getRootSegment();
                populate_config_names(root_iter);

                foreach(std::string& s, tree_ordered_simple_names) 
                {
                    if(parameters::has_attribute("ignored_dofs/"+s,reader,template_reader))
                    {
                        ignored_dofs.push_back(std::pair<std::string,double>());
                        ignored_dofs.back().first = s;
                        ignored_dofs.back().second = parameters::get_attribute_as<double>("ignored_dofs/"+s, reader, template_reader);
                    }
                    if(parameters::has_attribute("ignored_geoms/"+s,reader,template_reader))
                    {
                        ignored_geoms.push_back(s);
                    }
                }   

                //Alright first let's get a zero vector for every body that has a name
                for(unsigned i=0;i<tree_ordered_simple_names.size();i++)
                {
                    config_offsets.push_back( KDL::Frame() );
                }           
                parameter_reader_t::reader_map_t subsystem_map = parameters::get_map("config_offsets", reader, template_reader);
                foreach(const parameter_reader_t::reader_map_t::value_type key_value, subsystem_map)
                {
                    std::vector<double> offset = key_value.second->get_attribute_as<std::vector<double> >("offset");
                    KDL::Frame tmpVec = KDL::Frame(KDL::Vector(offset[0],offset[1],offset[2]));
                    //Kinda dumb, but let's just search the body
                    for( unsigned i=0; i<tree_ordered_simple_names.size(); ++i )
                    {
                        if( key_value.first == tree_ordered_simple_names[i] )
                        {
                            config_offsets[i] = tmpVec;
                        }
                    }
                }      

                std::vector<unsigned> blank_vec;
                unsigned state_size=0;
                manip_tree = new manip_node_t();
                manip_tree->kdl_node = root_iter;
                populate_state_vectors(root_iter,manip_tree,blank_vec); 
                for(unsigned i=0;i<state_memory.size();i++)
                {
                    control_memory.push_back(new double);
                }

                //read the chain_map entries from input 
                parameter_reader_t::reader_map_t chain_readers = parameters::get_map("chains", reader, template_reader);

                foreach(const parameter_reader_t::reader_map_t::value_type key_value, chain_readers)
                {
                    std::string start_link = key_value.second->get_attribute("start_link");
                    std::string end_link = key_value.second->get_attribute("end_link");
                    std::vector<unsigned>* new_vec = get_state_indices(start_link,end_link);
                    chain_map[start_link+"_"+end_link] = new_vec;
                } 


                //We need to do the population of the state_memory and control_memory before we call create_spaces.
                std::vector<std::string> ee_names;
                if(parameters::has_attribute("end_effectors",reader,template_reader))
                {
                    ee_names = parameters::get_attribute_as<std::vector<std::string> >("end_effectors", reader, template_reader);
                    foreach(std::string name, ee_names)
                    {
                        end_effector_states.push_back(1);
                        end_effector_controls.push_back(0);                        
                    }

                    for(unsigned i=0; i<ee_names.size(); ++i)
                    {
                        state_memory.push_back(&end_effector_states[i]);
                        control_memory.push_back(&end_effector_controls[i]);
                    }
                } 
                else
                    PRX_FATAL_S("A manipulator needs at least one end effector. Please specify this in the input!");



                grasped_ignored.resize(ee_names.size());

                create_spaces();
                inter_st = state_space->alloc_point();                
                integration_plant_t::init(reader,template_reader); 

                //We have to do the effector_names after the initialization of the plant. 
                //We don't have the pathname before the initialization. 
                foreach(std::string name, ee_names)
                {
                    effector_names.push_back(pathname + "/" + name);
                }


                // config_t test_config;
                // parameters::initialize<config_t > (&test_config,reader,"test_config",template_reader,"test_config");
                // state_t* result_state = state_space->alloc_point();
                // FK_solver(test_config,ee_names[0]);
                // PRX_DEBUG_COLOR("Root Geom: "<<kdl_tree->getRootSegment()->first<<" : " <<  test_config,PRX_TEXT_RED);
                // if(!IK_solver(result_state, result_state, test_config, kdl_tree->getRootSegment()->first, ee_names[0]))
                //     PRX_DEBUG_COLOR("No IK", PRX_TEXT_RED);
                // state_space->copy_from_point(result_state);
                
            }

            void manipulator_t::update_phys_configs(config_list_t& configs, unsigned& index) const
            {
                unsigned name_index=0;
                update_phys_configs(configs,index,manip_tree,root_frame,name_index);
            }

            void manipulator_t::link_collision_info(collision_checker_t* collision_checker)
            {
                collision_infos.resize(tree_ordered_config_names.size());
                for(unsigned i=0;i<collision_infos.size();i++)
                    collision_infos[i].first = NULL;
                int i =0;
                for( unsigned i = 0; i < tree_ordered_config_names.size(); i++ )
                {
                    collision_infos[i].first = collision_checker->get_collision_info(tree_ordered_config_names[i]);
                    PRX_DEBUG_S(collision_infos[i].first<<" "<<tree_ordered_simple_names[i]);
                }
            }

            void manipulator_t::update_collision_info()
            {
                unsigned name_index=0;
                update_collision_info(manip_tree,root_frame,name_index);
                for(unsigned i=0;i<collision_infos.size();i++)
                {
                    if(collision_infos[i].first!=NULL)
                        collision_infos[i].first->update_matrices(collision_infos[i].second);
                }         
            }

            void manipulator_t::steering_function(const state_t* start, const state_t* goal, plan_t& result_plan)
            {
                //each joint is independent
                double max_time = 0;
                for(unsigned i=0;i<state_space->get_dimension()-end_effector_states.size(); i++)
                {
                    double dist = goal->memory[i] - start->memory[i];
                    double vel = input_control_space->get_bounds()[i]->get_upper_bound();
                    double test_time = fabs(dist)/vel;
                    if(vel <= 0.000000001)
                        test_time = 0;
                    if(test_time>max_time)
                        max_time = test_time;
                }
                double steps = std::ceil(max_time / simulation::simulation_step);
                max_time = steps * simulation::simulation_step;
                result_plan.append_onto_back(max_time);
                std::vector<double> new_control;
                for(unsigned i=0;i<state_space->get_dimension()-end_effector_states.size(); i++)
                {
                    double dist = goal->memory[i] - start->memory[i];
                    new_control.push_back(dist/max_time);
                }
                for(unsigned i=state_space->get_dimension()-end_effector_states.size()-1;i<state_space->get_dimension(); i++)
                {
                    if( start->memory[i] != goal->memory[i] )
                    {
                        PRX_PRINT( " start state :: " << state_space->print_point( start, 3 ), PRX_TEXT_BROWN );
                        PRX_PRINT( " goal  state :: " << state_space->print_point( goal, 3 ), PRX_TEXT_BROWN );
                        PRX_FATAL_S( " Steering error: start grasping state different than the goal one" );
                    }
                }
                input_control_space->set_from_vector(new_control, result_plan.back().control);
            }

            std::string manipulator_t::get_end_effector_name(int index) const
            {
                return effector_names[index];
            }

            const std::vector<std::string>& manipulator_t::get_end_effector_names() const
            {
                return effector_names;
            }

            void manipulator_t::get_end_effector_names(std::vector<std::string>& names)
            {
                names.insert(names.end(), effector_names.begin(), effector_names.end());
            }

            std::vector<std::string> manipulator_t::get_ignored_grasping_bodies(int index)
            {
                return grasped_ignored[index];
            }

            bool manipulator_t::is_end_effector_closed(int index) const
            {
                return (end_effector_states[index] == 2);
            }


            void manipulator_t::FK_solver( config_t& goal_config, std::string link_name)
            {
                //TODO: Find out if we can make this faster by not creating chains: ZL
                KDL::Chain chain1;
                kdl_tree->getChain(kdl_tree->getRootSegment()->first, link_name, chain1);                
                KDL::JntArray q(chain1.getNrOfJoints());               

                std::vector< double > state_var;
                state_space->copy_to_vector( state_var );

                std::vector<unsigned>* indices = chain_map[kdl_tree->getRootSegment()->first+"_"+link_name];

                for(unsigned i = 0; i<indices->size(); ++i)
                {
                    q(i) = state_var[indices->at(i)];
                }

                KDL::ChainFkSolverPos_recursive fk_solver(chain1);
                KDL::Frame F;
                fk_solver.JntToCart(q,F); 
                F = root_frame*F;

                goal_config.set_position(F.p.x(),F.p.y(),F.p.z());
                double qx,qy,qz,qw;
                F.M.GetQuaternion(qx,qy,qz,qw);
                goal_config.set_orientation(qx,qy,qz,qw);
            }

            bool manipulator_t::IK_solver( space_point_t* result_state, const space_point_t* start_state, const config_t& goal_config, std::string start_link, std::string end_link)
            {
                state_space->copy_from_point(start_state);

                double qx,qy,qz,qw;
                double x,y,z;
                goal_config.get_orientation().get(qx,qy,qz,qw);
                goal_config.get_position(x,y,z);
                KDL::Chain chain1;
                kdl_tree->getChain(start_link, end_link, chain1);                
                KDL::JntArray q(chain1.getNrOfJoints());
                KDL::JntArray q_out(chain1.getNrOfJoints());
                KDL::JntArray q_min(chain1.getNrOfJoints());
                KDL::JntArray q_max(chain1.getNrOfJoints());                

                std::vector< double > state_var;
                state_space->copy_point_to_vector( start_state, state_var );

                std::vector<unsigned>* indices = chain_map[start_link+"_"+end_link];

                unsigned index;
                for(unsigned i = 0; i<indices->size(); ++i)
                {
                    index = indices->at(i);
                    q(i) = state_var[index];
                    q_min(i) = state_space->get_bounds()[index]->get_lower_bound();
                    q_max(i) = state_space->get_bounds()[index]->get_upper_bound();
                }

                KDL::ChainFkSolverPos_recursive fk_solver(chain1);
                KDL::ChainIkSolverVel_pinv ik_solver_vel(chain1);
                KDL::ChainIkSolverPos_NR_JL ik_solver(chain1,q_min,q_max,fk_solver,ik_solver_vel,IK_ITERATIONS,1e-6);

                //We subtract the offset of the base to bring the root frame back to 0,0,0 before calling IK.
                KDL::Frame F(KDL::Rotation::Quaternion(qx,qy,qz,qw),KDL::Vector(x, y, z));
                F = root_frame.Inverse()*F;
                
                bool ik_res = (ik_solver.CartToJnt(q,F,q_out)>=0);

                int count=0;
                while(!ik_res && count<0)
                {
                    for(unsigned i=0 ; i< indices->size() ; i++)
                    {
                        q(i) = uniform_random(q_min(i),q_max(i));
                    }
                    count++;
                    ik_res = (ik_solver.CartToJnt(q,F,q_out)>=0);
                }
                
                if(ik_res)
                {
                    std::vector<double> state_vec = state_var;

                    for(int i = 0; i<indices->size(); ++i)
                    {
                        state_vec[indices->at(i)] = q_out(i);
                    }

                    state_space->copy_vector_to_point( state_vec, result_state );
                }
                
                return ik_res;                
            }

            bool manipulator_t::IK_fast_solver( space_point_t* result_state, const config_t& goal_config)
            {
                PRX_FATAL_S("IK Fast not implemented for the manipulator.");
            }

            bool manipulator_t::IK_steering( sim::plan_t& result_plan,  util::space_point_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config, std::string start_link, std::string end_link)
            {
                state_space->copy_from_point(start_state);
                config_t start_config;
                FK_solver(start_config, end_link);

                //Begin by determining a distance between the start and goal configurations
                double distance = start_config.get_position().distance( goal_config.get_position() );
                //Set the number of interpolation steps
                double steps = std::ceil(distance / MAX_IK_STEP);
                //Clear out the plan we were given, we will be filling it in ourselves
                result_plan.clear();
                //Keep around an intermediate plan for systematically building up the solution
                plan_t intermediate_plan = result_plan;

                //Store the arm's current state as the previous state
                state_space->copy_to_point(result_state);
                //So first, let's do the IK for the start configuration
                if( !IK_solver( result_state, start_state, start_config, start_link, end_link ) )
                {
                    PRX_DEBUG_COLOR("IK failed in Steering for the start config.", PRX_TEXT_RED);
                    return false;
                }

                //Storage for the interpolated configuration
                config_t interpolated_config;

                //Then, for each step
                for( double i=1; i<steps; ++i )
                {
                    //Compute the next interpolated configuration
                    double t = i/steps;
                    interpolated_config.interpolate( start_config, goal_config, t );

                    //Compute Minimum IK for interpolated configuration (Pose, seed state, soln)
                    if( IK_solver( inter_st, result_state, interpolated_config, start_link, end_link ) )
                    {
                        //Create a plan by steering between states and add it to the resulting plan
                        intermediate_plan.clear();
                        steering_function(result_state, inter_st, intermediate_plan);
                        result_plan += intermediate_plan;
                        //And make sure we store this state as our prior state
                        state_space->copy_point(result_state, inter_st);
                    }
                    else
                    {
                        //Clear out whatever plan we had started making
                        PRX_DEBUG_COLOR("IK failed in Steering", PRX_TEXT_BROWN);
                        result_plan.clear();
                        return false;
                    }
                }

                if( IK_solver( inter_st, result_state, goal_config, start_link, end_link ) )
                {
                    //Create a plan by steering between states and add it to the resulting plan
                    intermediate_plan.clear();
                    steering_function(result_state, inter_st, intermediate_plan);
                    result_plan += intermediate_plan;
                    //And make sure we store this state as our prior state
                    state_space->copy_point(result_state, inter_st);
                }
                else
                {
                    //Clear out whatever plan we had started making
                    PRX_DEBUG_COLOR("IK failed in Steering", PRX_TEXT_BROWN);
                    result_plan.clear();
                    return false;
                }


                //Report our Success
                return true;
            }

            void manipulator_t::update_derivative(state_t * const result)
            {
                //update state 
                for(unsigned index=0;index<state_space->get_dimension();index++)
                    result->memory[index] = *control_memory[index];
                int i=0;
                for(unsigned index=state_space->get_dimension()- end_effector_controls.size();index<state_space->get_dimension();index++)
                {
                    if(end_effector_controls[i]!=0)
                    {
                        //PRX_DEBUG_COLOR("grasping id: " << index << "   control: " << end_effector_controls[i] << "     state memory: " << *state_memory[index], PRX_TEXT_CYAN);
                        result->memory[index] = round(end_effector_controls[i] - *state_memory[index])*GRASP_STEP;
                    }
                    else
                        result->memory[index] = 0;
                    
                    i++;
                }
            }

            void manipulator_t::update_phys_configs(config_list_t& configs, unsigned& index, 
                                                    manip_node_t* node, const KDL::Frame& parent_frame, 
                                                    unsigned& name_index) const
            {
                //get the segment from the tree
                KDL::Segment seg = GetTreeElementSegment(node->kdl_node->second);
                KDL::Frame this_frame;

                //if this is a controllable joint
                if(node->memory!=NULL)
                {
                    this_frame = parent_frame*seg.pose(*node->memory);
                }
                //if this is a fixed joint, we just need the configuration of the segment
                else
                {
                    this_frame = parent_frame*seg.pose(0.0);
                }

                if(node->physical_geoms)
                {
                    KDL::Frame phys_frame = this_frame*config_offsets[name_index];
                    //make sure there is room in the list
                    augment_config_list(configs,index);
                    //assign the correct name for this config
                    configs[index].first = tree_ordered_config_names[name_index];
                    //set the configuration
                    configs[index].second.set_position(phys_frame.p.x(),phys_frame.p.y(),phys_frame.p.z());
                    double qx,qy,qz,qw;
                    phys_frame.M.GetQuaternion(qx,qy,qz,qw);
                    configs[index].second.set_orientation(qx,qy,qz,qw);
                    index++;
                }
                name_index++;

                //recursively call everything
                foreach(manip_node_t* child, node->children )
                {
                    update_phys_configs(configs,index,child,this_frame,name_index);
                }
            }

            void manipulator_t::update_collision_info(manip_node_t* node, KDL::Frame& parent_frame,unsigned& name_index)
            {
                //get the segment from the tree
                KDL::Segment seg = GetTreeElementSegment(node->kdl_node->second);
                KDL::Frame this_frame;
                //if this is a controllable joint
                if(node->memory!=NULL)
                {
                    this_frame = parent_frame*seg.pose(*node->memory);
                }
                //if this is a fixed joint, we just need the configuration of the segment
                else
                {
                    this_frame = parent_frame*seg.pose(0.0);
                }

                if(node->physical_geoms)
                {
                    KDL::Frame phys_frame = this_frame*config_offsets[name_index];
                    //set the configuration
                    collision_infos[name_index].second.set_position(phys_frame.p.x(),phys_frame.p.y(),phys_frame.p.z());
                    double qx,qy,qz,qw;
                    phys_frame.M.GetQuaternion(qx,qy,qz,qw);
                    collision_infos[name_index].second.set_orientation(qx,qy,qz,qw);
                }
                name_index++;

                //recursively call everything
                foreach(manip_node_t* child, node->children )
                {
                    update_collision_info(child,this_frame,name_index);
                }
            }

            void manipulator_t::populate_config_names(KDL::SegmentMap::const_iterator iter)
            {
                tree_ordered_config_names.push_back(pathname + "/" + iter->first);
                tree_ordered_simple_names.push_back(iter->first);
                foreach(KDL::SegmentMap::const_iterator child, GetTreeElementChildren(iter->second) )
                {
                    populate_config_names(child);
                }
            }

            void manipulator_t::populate_state_vectors(KDL::SegmentMap::const_iterator iter, manip_node_t* node, std::vector<unsigned> state_indices)
            {
                //if this is a controllable joint
                KDL::Segment seg = GetTreeElementSegment(iter->second);
                if(seg.getJoint().getType()!=KDL::Joint::None)
                {
                    node->memory = new double;
                    bool found_ignored=false;
                    for (std::vector<std::pair<std::string, double> >::iterator i = ignored_dofs.begin(); i != ignored_dofs.end() && !found_ignored; ++i)
                    {
                        if(iter->first==i->first)
                        {
                            PRX_PRINT("IGN: "<<iter->first,PRX_TEXT_MAGENTA);
                            found_ignored = true;
                            *node->memory = i->second;
                        }
                    }
                    if(!found_ignored)
                    {
                        PRX_PRINT(iter->first,PRX_TEXT_CYAN);
                        state_memory.push_back(node->memory);
                        state_indices.push_back(state_memory.size()-1);
                        node->state_index = state_memory.size()-1;
                    }
                }

                for (unsigned i=0;i<ignored_geoms.size();i++)
                {
                    if(iter->first==ignored_geoms[i])
                    {
                        node->physical_geoms = false;
                    }
                }
                
                std::vector<unsigned>* new_vec = new std::vector<unsigned>();
                *new_vec = state_indices;
                chain_map[kdl_tree->getRootSegment()->first+"_"+iter->first] = new_vec;

                foreach(KDL::SegmentMap::const_iterator child, GetTreeElementChildren(iter->second) )
                {
                    manip_node_t* new_node = new manip_node_t();
                    new_node->kdl_node = child;
                    new_node->parent = node;
                    node->children.push_back(new_node);
                    populate_state_vectors(child,new_node,state_indices);
                }
            }

            std::vector<unsigned>* manipulator_t::get_state_indices(std::string start_link, std::string end_link)
            {
                std::deque<manip_node_t*> to_explore;
                to_explore.push_back(manip_tree);
                manip_node_t* end_node=NULL;
                while(to_explore.size()!=0)
                {
                    manip_node_t* examined_node = to_explore.front();
                    to_explore.pop_front();
                    if(examined_node->kdl_node->first==end_link)
                    {
                        end_node = examined_node;
                        to_explore.clear();
                    }
                    else
                    {
                        foreach(manip_node_t* child, examined_node->children)
                        {
                            to_explore.push_back(child);
                        }
                    }
                }

                std::vector<unsigned>* indices = new std::vector<unsigned>();
                while(end_node->kdl_node->first!=start_link)
                {
                    if(end_node->memory!=NULL)
                    {
                        indices->push_back(end_node->state_index);
                    }
                    end_node = end_node->parent;
                }
                if(end_node->memory!=NULL)
                {
                    indices->push_back(end_node->state_index);
                }
                std::reverse(indices->begin(),indices->end());
                return indices;
            }

        }
    }
}