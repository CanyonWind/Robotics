/**
 * @file manipulator_simulator.hpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "simulation/simulators/manipulation_simulator.hpp"

#include "prx/simulation/collision_checking/collision_checker.hpp"
#include "prx/utilities/spaces/space.hpp"
#include "prx/simulation/cost_functions/default_uniform.hpp"

#include <pluginlib/class_list_macros.h>
#include <boost/tuple/tuple.hpp>
#include <boost/assign/list_of.hpp>
#include <boost/range/adaptor/map.hpp>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::manipulation_simulator_t, prx::sim::simulator_t)

namespace prx
{
    using namespace util;
    using namespace sim;

    namespace packages
    {

        namespace manipulation
        {

            manipulation_simulator_t::manipulation_simulator_t() : default_simulator_t()
            {
                collision_response = false;
                collision_detection = true;
                
                updated_collision_list = new vector_collision_list_t();
            }

            manipulation_simulator_t::~manipulation_simulator_t()
            {
                delete updated_collision_list;
            }

            void manipulation_simulator_t::init(const parameter_reader_t * reader, const parameter_reader_t* template_reader)
            {
                simulator_t::init(reader, template_reader);

                util::hash_t<std::string, sim::plant_t*> plants;
                system_graph_t::directed_vertex_t v = update_system_graph(sys_graph);
                sys_graph.get_path_plant_hash(plants);

                foreach(plant_t* plant, plants | boost::adaptors::map_values)
                {
                    //Create and initialize information for all the end effectors. 
                    if(dynamic_cast<manipulator_t*>(plant) != NULL)
                    {
                        //Create end effector infos for each end effector.
                        manipulator_t* manip = dynamic_cast<manipulator_t*>(plant);
                        manipulators.push_back(manip);
                        unsigned index = 0;
                        foreach(std::string ee_name, manip->get_end_effector_names())
                        {                            
                            end_effectors.push_back(new end_effector_info_t(manip,index,ee_name));
                            index++;
                        }
                    }

                    //Create a list of all the movable bodies.
                    if(dynamic_cast<movable_body_plant_t*>(plant) != NULL)
                    {
                        movable_bodies.push_back(dynamic_cast<movable_body_plant_t*>(plant));
                    }
                }

                if(end_effectors.size() == 0)
                    PRX_FATAL_S("Manipulation simulator needs at least one end effector!");

                if(movable_bodies.size() == 0)
                    PRX_FATAL_S("Manipulation simulator needs at least one movable body so the manipulator can move something!");


                state_memory.clear();  
                std::string space_name;
                unsigned size = end_effectors.size();
                unsigned index = 0;
                //setup collision list for end effectors and the state space of the simulator.
                foreach(end_effector_info_t* info, end_effectors)
                {
                    foreach(movable_body_plant_t* object, movable_bodies)
                    {
                        std::vector<std::string>  names = *object->get_geometries_names();
                        foreach(std::string& s, names)
                        {
                            info->grasping_check_list->add_pair(info->end_effector_name,s);
                        }
                    }

                    state_memory.push_back(info->grasped_object_id);
                    space_name += "D";
                    if(index < size-1)
                        space_name += "|";
                    index++;
                }
                controller_state_space = new space_t(space_name,state_memory);

                std::vector<bounds_t*> bounds = controller_state_space->get_bounds();

                for (int i = 0; i < bounds.size(); ++i)
                {
                    bounds[i]->set_bounds(-1,movable_bodies.size()-1);
                }

                construct_spaces();

            }

            void manipulation_simulator_t::push_state(const sim::state_t * const state)
            {
                default_simulator_t::push_state(state);
                foreach(end_effector_info_t* info, end_effectors)
                {
                    if(*info->grasped_object_id >= 0 )
                    {
                        //Compute relative config between end effector and the grasped object. 
                        if(!info->static_relative_configuration)
                            compute_relative_config(info);
                    }
                    else
                    {
                        release_object(info);
                    }
                }
            }

            void manipulation_simulator_t::link_collision_list(collision_list_t* collision_list)
            {
                updated_collision_list->clear();

                PRX_PRINT("Number of collision pairs: "<<collision_list->size(),PRX_TEXT_RED);
                foreach(collision_pair_t p, collision_list->get_body_pairs())
                {
                    bool found_ee = false;
                    for( unsigned i = 0; i < end_effectors.size() && !found_ee; ++i )
                    {
                        if( p.first == end_effectors[i]->end_effector_name || p.second == end_effectors[i]->end_effector_name )
                        {
                            found_ee = true;
                        }
                    }
                    if(!found_ee)
                        updated_collision_list->add_new_pair(p);
                }
                PRX_PRINT("Number of collision pairs: "<<updated_collision_list->size(),PRX_TEXT_RED);

                collision_checker->link_collision_list(updated_collision_list);
            }

            bool manipulation_simulator_t::in_collision()
            {
                move_grasped_objects();

                sim::collision_list_t* in_collision_list = default_simulator_t::get_colliding_bodies();

                foreach( collision_pair_t p, in_collision_list->get_body_pairs() )
                {
                    bool valid_collision = true;
                    for( unsigned i = 0; valid_collision == true && i < end_effectors.size(); ++i )
                    {
                        if( end_effectors[i]->object != NULL )
                        {
                            for( unsigned j=0; valid_collision==true && j < end_effectors[i]->ignore_during_grasping.size(); ++j )
                            {
                                if( p.first == end_effectors[i]->ignore_during_grasping[j] )
                                {
                                    std::vector<std::string>* rigid_body_names = end_effectors[i]->object->get_geometries_names();
                                    for(unsigned r=0; valid_collision == true && r < rigid_body_names->size(); ++r)
                                    {
                                        if(p.second == rigid_body_names->at(r))
                                            valid_collision = false;
                                    }
                                }

                                else if(p.second == end_effectors[i]->ignore_during_grasping[j] )
                                {
                                    std::vector<std::string>* rigid_body_names = end_effectors[i]->object->get_geometries_names();
                                    for(unsigned r=0; valid_collision == true && r < rigid_body_names->size(); ++r)
                                    {
                                        if(p.first == rigid_body_names->at(r))
                                            valid_collision = false;
                                    }
                                }
                            }
                        }
                    }

                    if( valid_collision )
                    {
                        return true;
                    }
                }
                return false;

            }

            void manipulation_simulator_t::propagate(const double simulation_step)
            {
                foreach(end_effector_info_t* info, end_effectors)
                {
                    info->prev_grasping_mode = info->manipulator->is_end_effector_closed(info->end_effector_index);
                }

                //Do the standard propagation
                simulator_t::propagate( simulation_step );

                move_grasped_objects();

                //Determining if a new grasp is need or if we need to release an object. 
                bool collision_is_updated = false;
                foreach(end_effector_info_t* info, end_effectors)
                {
                    //if the grasp state has changed.
                    bool grasp = info->manipulator->is_end_effector_closed(info->end_effector_index);
                    if(info->prev_grasping_mode != grasp)
                    {  
                        //Grasp a new object.
                        if(grasp)
                        {   
                            if(!collision_is_updated)
                            {
                                update_collision_info();
                                collision_is_updated = true;
                            }
                            //We have to start a new grasp and get the correct object through collision checking.                             
                            detect_new_grasped_object(info);
                            collision_checker->link_collision_list(updated_collision_list);
                        }
                        else
                        {
                            release_object(info);
                        }
                    }
                }
            }

            void manipulation_simulator_t::propagate_and_respond()
            {
                propagate(simulation::simulation_step);
                in_collision();
            }

            void manipulation_simulator_t::set_static_relative_config(std::string name, bool flag)
            {
                foreach(end_effector_info_t* info, end_effectors)
                {
                    if(name == info->end_effector_name)
                    {
                        if(info->object == NULL)
                            PRX_FATAL_S("You cannot maintain a relative configuration without grasping an object!");
                        info->static_relative_configuration = flag;
                        return;
                    }
                }
            }

            void manipulation_simulator_t::get_movable_objects(std::vector<movable_body_plant_t* >& objects)
            {
                objects.insert(objects.end(), movable_bodies.begin(), movable_bodies.end());
            }

            void manipulation_simulator_t::get_manipulators(std::vector<manipulator_t* >& manipulators)
            {
                manipulators.insert(manipulators.end(), this->manipulators.begin(), this->manipulators.end());
            }

            void manipulation_simulator_t::move_grasped_objects()
            {
                //For each end effector
                foreach(end_effector_info_t* info, end_effectors)
                {
                    if(info->object != NULL)
                    {
                        info->manipulator->FK_solver(effector_config,info->simple_end_effector_name);
                        info->object->move_object(effector_config,info->relative_config);
                    }
                }
            }        

            void manipulation_simulator_t::compute_relative_config(end_effector_info_t* info)
            {
                info->object = movable_bodies[*info->grasped_object_id];
                info->manipulator->FK_solver(effector_config,info->simple_end_effector_name);
                info->object->relative_config_with_manipulator(effector_config,info->relative_config);
            }

            void manipulation_simulator_t::release_object(end_effector_info_t* info)
            {
                info->object = NULL;
                *info->grasped_object_id = -1;
                info->static_relative_configuration = false;
            }

            bool manipulation_simulator_t::detect_new_grasped_object(end_effector_info_t* info)
            {
                collision_checker->link_collision_list(info->grasping_check_list);
                sim::collision_list_t* in_collision_list = default_simulator_t::get_colliding_bodies();

                PRX_ASSERT(*info->grasped_object_id == -1);
                foreach( collision_pair_t p, in_collision_list->get_body_pairs() )
                {
                    for(unsigned i = 0; i < movable_bodies.size(); ++i)
                    {
                        std::vector<std::string>* rigid_body_names = movable_bodies[i]->get_geometries_names();
                        for(unsigned j = 0; j < rigid_body_names->size(); ++j)
                        {
                            //We need to check only the p.second because the collision list has been set to be 
                            //pairs of end effector vs movable object. 
                            if(p.second == rigid_body_names->at(j))
                            {
#ifndef NDEBUG
                                if(*info->grasped_object_id >= 0)
                                {
                                    PRX_FATAL_S("I do not know what to do! I cannot grasp two objects at the same time!!!");
                                }
#endif
                                *info->grasped_object_id = i;
                                compute_relative_config(info);
                                PRX_DEBUG_COLOR("Grasped with relative configuration: "<< info->relative_config, PRX_TEXT_RED);
#ifndef NDEBUG
                                break;
#else
                                return true;
#endif
                            }
                        }
                    }
                }
                return false;
            }

            void manipulation_simulator_t::print_relative_config()
            {
                foreach(end_effector_info_t* info, end_effectors)
                {
                    PRX_PRINT(info->print(),PRX_TEXT_GREEN);
                }
            }
        }
    }
}