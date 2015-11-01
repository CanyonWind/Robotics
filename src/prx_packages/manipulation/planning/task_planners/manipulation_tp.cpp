/**
 * @file manipulation_tp.cpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "planning/task_planners/manipulation_tp.hpp"

#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/statistics/statistics.hpp"

#include <boost/range/adaptor/map.hpp>
#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::manipulation_tp_t, prx::plan::planner_t)

namespace prx
{
    using namespace util;
    using namespace sim;
    using namespace plan;

    namespace packages
    {
        namespace manipulation
        {

            manipulation_tp_t::manipulation_tp_t()
            {

            }

            manipulation_tp_t::~manipulation_tp_t()
            {

            }

            void manipulation_tp_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                PRX_INFO_S("Initializing Manipulation task planner ...");

                std::string template_name;
                planner_t::init(reader, template_reader);
                
                //initialize the motion planners
                if( reader->has_attribute("planners") )
                {
                    parameter_reader_t::reader_map_t planner_map = reader->get_map("planners");

                    foreach(const parameter_reader_t::reader_map_t::value_type key_value, planner_map)
                    {
                        PRX_INFO_S("Creating a planner with name: " << key_value.first);
                        const parameter_reader_t* child_template_reader = NULL;

                        if( key_value.second->has_attribute("template") )
                        {
                            template_name = key_value.second->get_attribute("template");
                            child_template_reader = new parameter_reader_t(ros::this_node::getName() + "/" + template_name);
                        }
                        planner_t* new_planner = parameters::create_from_loader<planner_t > ("prx_planning", key_value.second, "", child_template_reader, "");
                        std::string planner_name = key_value.first;
                        new_planner->set_pathname(path + "/" + planner_name);
                        parameters::initialize(new_planner,key_value.second,"",child_template_reader,"");
                        //perform an operation to get the mappings from the world model and pass them to the motion planners
                        planner_names.push_back(planner_name);
                        planners[planner_name] = new_planner;
                        planners[planner_name]->set_pathname(path + "/" + planner_name);

                        space_names[planner_name] = parameters::get_attribute_as<std::string > ("space_name", key_value.second, child_template_reader);                        
                        
                        //Initialize the query for this motion planner.
                        if(!parameters::has_attribute("query", key_value.second,child_template_reader))
                            PRX_FATAL_S("The motion planner inside the manipulation task planner has to setup a query!");

                        const parameter_reader_t* query_template_reader = NULL;
                        if(parameters::has_attribute("query/template", key_value.second, child_template_reader))
                        {
                            template_name = parameters::get_attribute("query/template",key_value.second,child_template_reader);
                            query_template_reader = new parameter_reader_t(ros::this_node::getName() + "/" + template_name);
                        }

                        query_t* new_query = parameters::initialize_from_loader<query_t > ("prx_planning", key_value.second, "query/template", query_template_reader, "");

                        context_maps[space_names[planner_name]] = new planner_context_info_t(space_names[planner_name], new_planner, new_query);

                        if( child_template_reader != NULL )
                        {
                            delete child_template_reader;
                            child_template_reader = NULL;
                        }

                        if( query_template_reader != NULL )
                        {
                            delete query_template_reader;
                            query_template_reader = NULL;
                        }
                    }
                } 

                //Initializing the grasping planner.
                if(!parameters::has_attribute("grasping_planner",reader,template_reader))
                    PRX_FATAL_S("Manipulation task planner needs a grasping planner!");

                const parameter_reader_t* grasping_planner_template_reader = NULL;

                if( parameters::has_attribute("grasping_planner/template",reader,template_reader) )
                {
                    std::string template_name = parameters::get_attribute("grasping_planner/template",reader,template_reader);
                    grasping_planner_template_reader = new parameter_reader_t(ros::this_node::getName() + "/" + template_name);
                }

                grasping_planner = parameters::create_from_loader<planner_t > ("prx_planning", reader, "grasping_planner", grasping_planner_template_reader, "");
                grasping_planner->set_pathname(path + "/grasping_planner");
                parameters::initialize(grasping_planner, reader, "grasping_planner", grasping_planner_template_reader, "");

                if( grasping_planner_template_reader != NULL )
                {
                    delete grasping_planner_template_reader;
                    grasping_planner_template_reader = NULL;
                }

                serialize_flag = parameters::get_attribute_as<bool>("serialize_flag", reader, template_reader, false);
            }

            void manipulation_tp_t::setup()
            {
                PRX_INFO_S("Setup manipulation tp ...");
                std::string old_context = model->get_current_context();
                foreach(planner_context_info_t* planner_info, context_maps | boost::adaptors::map_values)
                {
                    model->use_context(planner_info->planning_context_name);
                    planner_info->link_spaces(model->get_state_space(), model->get_control_space());
                }
                model->use_context(old_context);

            }

            void manipulation_tp_t::reset()
            {
                
            }

            void manipulation_tp_t::link_world_model(world_model_t * const model)
            {
                task_planner_t::link_world_model(model);
                manipulation_model = dynamic_cast<manipulation_world_model_t*>(model);
                if(manipulation_model == NULL)
                    PRX_FATAL_S("The manipulation task planner can work only with manipulation world model!");
                grasping_planner->link_world_model(model);
            }

            const statistics_t* manipulation_tp_t::get_statistics()
            {
                PRX_WARN_S("Get statistics for manipulation task planner is not implemented!");
                return new statistics_t();
            }

            void manipulation_tp_t::link_specification(specification_t* new_spec)
            {
                task_planner_t::link_specification(new_spec);
            }

            void manipulation_tp_t::link_query(query_t* new_query)
            {
                task_planner_t::link_query(new_query);
                manipulation_query = dynamic_cast<manipulation_query_t*>(new_query);
                if(manipulation_query == NULL) 
                    PRX_FATAL_S("The manipulation task planner operate only over a manipulation query as input!");

                active_planner = context_maps[manipulation_query->manipulation_context_name];
                model->use_context(manipulation_query->manipulation_context_name);
            }        

            bool manipulation_tp_t::serialize()
            {
                std::string old_context = model->get_current_context();
                foreach(planner_context_info_t* planner_info, context_maps | boost::adaptors::map_values)
                {
                    model->use_context(planner_info->planning_context_name);
                    if(!planner_info->planner->serialize())
                        PRX_FATAL_S("Planner " << planner_info->planner_name << " failed to serialize!");
                }
                model->use_context(old_context);
                return true;
            }

            bool manipulation_tp_t::deserialize()
            {
                std::string old_context = model->get_current_context();
                foreach(planner_context_info_t* planner_info, context_maps | boost::adaptors::map_values)
                {
                    model->use_context(planner_info->planning_context_name);
                    if(!planner_info->planner->deserialize())
                        PRX_FATAL_S("Planner " << planner_info->planner_name << " failed to deserialize!");
                }
                model->use_context(old_context);                
                return true;
            }

            bool manipulation_tp_t::succeeded() const
            {
                return true;
                //return false;
            }

            bool manipulation_tp_t::execute()
            {
                
                std::string old_context = model->get_current_context();
                foreach(planner_context_info_t* planner_info, context_maps | boost::adaptors::map_values)
                {
                    model->use_context(planner_info->planning_context_name);
                    if(!planner_info->planner->execute())
                        PRX_FATAL_S("Planner " << planner_info->planner_name << " failed to execute!");
                }
                model->use_context(old_context);

                if( serialize_flag )
                    serialize();

                return true;
            }

            void manipulation_tp_t::resolve_query()
            {
                if(manipulation_query->mode == manipulation_query_t::PRX_PICK)
                    manipulation_query->found_path = pick(manipulation_query->plan, manipulation_query->manipulator_final_state, manipulation_query->manipulator_initial_state, manipulation_query->object_initial_state, manipulation_query->grasping_id);
                else if(manipulation_query->mode == manipulation_query_t::PRX_PLACE)
                    manipulation_query->found_path = place(manipulation_query->plan, manipulation_query->manipulator_final_state, manipulation_query->manipulator_initial_state, manipulation_query->object_target_state, manipulation_query->grasping_id);
                else if(manipulation_query->mode == manipulation_query_t::PRX_MOVE)
                    manipulation_query->found_path = move(manipulation_query->plan, manipulation_query->manipulator_initial_state, manipulation_query->manipulator_target_state);
                else if(manipulation_query->mode == manipulation_query_t::PRX_PICK_AND_PLACE)
                    manipulation_query->found_path = pick_and_place(manipulation_query->plan, manipulation_query->manipulator_initial_state, manipulation_query->manipulator_target_state, manipulation_query->object_initial_state, manipulation_query->object_target_state, manipulation_query->grasping_id);
            }

            bool manipulation_tp_t::pick(plan_t& plan, state_t* manipulator_final_state, state_t* manipulator_initial_state, state_t* object_initial_state, int grasping_id)
            {
                grasping_query->setup(active_planner->state_space, active_planner->control_space, manipulation_query->object, grasping_id, object_initial_state);
                grasping_planner->link_query(grasping_query);
                grasping_planner->resolve_query();
                if(grasping_query->found_grasp)
                {
                    if(active_planner->compute_solution(manipulator_initial_state, grasping_query->retracted_open_state))
                    {
                        plan += active_planner->query->plan;                        
                        plan += grasping_query->reaching_plan;
                        manipulation_model->engage_grasp(plan, grasping_query->grasping_mode);
                        manipulator_final_state = grasping_query->grasping_state;
                        return true;
                    }

                }
                return false;
            }

            bool manipulation_tp_t::place(plan_t& plan, state_t* manipulator_final_state, state_t* manipulator_initial_state, state_t* object_target_state, int grasping_id)
            {
                grasping_query->setup(active_planner->state_space, active_planner->control_space, manipulation_query->object, grasping_id, object_target_state);
                grasping_planner->link_query(grasping_query);
                grasping_planner->resolve_query();
                if(grasping_query->found_grasp)
                {
                    if(active_planner->compute_solution(manipulator_initial_state, grasping_query->grasping_state))
                    {
                        plan += active_planner->query->plan;
                        //TODO: Here we have to release the object.
                        manipulation_model->engage_grasp(plan, grasping_query->grasping_mode);
                        plan += grasping_query->retracting_plan;
                        manipulator_final_state = grasping_query->retracted_open_state;
                        return true;
                    }

                }
                return false;
            }

            bool manipulation_tp_t::move(plan_t& plan, state_t* manipulator_initial_state, state_t* manipulator_target_state)
            {
                if(active_planner->compute_solution(manipulator_initial_state, manipulator_target_state))
                {
                    plan += active_planner->query->plan;
                    return true;
                }
                return false;
            }

            bool manipulation_tp_t::pick_and_place(plan_t& plan, state_t* manipulator_initial_state, state_t* manipulator_target_state, state_t* object_initial_state, state_t* object_target_state, int grasping_id)
            {
                state_t* tmp_state;
                //If the grasping id was -1 we have to be sure that the same grasping id will be used for the action place, 
                //thats why we are using the grasping id from the grasping query. 
                if(pick(plan, tmp_state, manipulator_initial_state, object_initial_state, manipulation_query->grasping_id))                
                    if(place(plan, tmp_state, tmp_state, object_target_state, grasping_query->grasping_id ))
                        if(move(plan, tmp_state, manipulator_target_state))
                            return true;
                return false;
            }

            void manipulation_tp_t::update_vis_info() const
            {

                foreach(planner_t* planner, planners | boost::adaptors::map_values)
                {

                    planner->update_visualization();
                }
            }
        }
    }
}
