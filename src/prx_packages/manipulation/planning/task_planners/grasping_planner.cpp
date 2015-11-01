/**
 * @file grasping_planner.cpp
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

#include "planning/task_planners/grasping_planner.hpp"

#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/statistics/statistics.hpp"
#include "prx/utilities/distance_metrics/distance_metric.hpp"

#include "prx/planning/motion_planners/motion_planner.hpp"
#include "prx/planning/modules/samplers/sampler.hpp"
#include "prx/planning/modules/validity_checkers/validity_checker.hpp"
#include "prx/planning/modules/local_planners/local_planner.hpp"

#include "planning/manipulation_world_model.hpp"
#include "planning/queries/manipulation_query.hpp"
#include "planning/queries/grasping_query.hpp"

#include <boost/range/adaptor/map.hpp>
#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::grasping_planner_t, prx::plan::planner_t)

namespace prx
{
    using namespace util;
    using namespace sim;
    using namespace plan;

    namespace packages
    {
        namespace manipulation
        {

            grasping_planner_t::grasping_planner_t()
            {

            }

            grasping_planner_t::~grasping_planner_t()
            {

            }

            void grasping_planner_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                planner_t::init(reader, template_reader);
                PRX_INFO_S("Initializing Grasping task planner ...");

                if( parameters::has_attribute("validity_checker", reader, template_reader) )
                {
                    validity_checker = parameters::initialize_from_loader<validity_checker_t > ("prx_planning", reader, "validity_checker", template_reader, "validity_checker");
                }
                else
                {
                    PRX_WARN_S("Missing validity_checker attribute in planning specification!");
                }


                if( parameters::has_attribute("sampler", reader, template_reader) )
                {
                    sampler = parameters::initialize_from_loader<sampler_t > ("prx_planning", reader, "sampler", template_reader, "sampler");
                }
                else
                {
                    PRX_WARN_S("Missing sampler attribute in planning specification!");
                }

                if( parameters::has_attribute("local_planner", reader, template_reader) )
                {
                    local_planner = parameters::initialize_from_loader<local_planner_t > ("prx_planning", reader, "local_planner", template_reader, "local_planner");
                }
                else
                {
                    PRX_WARN_S("Missing local_planner attribute in planning specification!");
                }

                if( parameters::has_attribute("distance_metric", reader, template_reader) )
                {
                    metric = parameters::initialize_from_loader<distance_metric_t > ("prx_utilities", reader, "distance_metric", template_reader, "distance_metric");
                }
                else
                {
                    PRX_WARN_S("Missing distance_metric attribute in planning specification!");
                }

                //TODO: here we have to read the files from where we will deserialize the data bases.
            }

            void grasping_planner_t::reset()
            {
                
            }

            void grasping_planner_t::link_world_model(world_model_t * const model)
            {
                manipulation_model = dynamic_cast<manipulation_world_model_t*>(model);
            }

            const statistics_t* grasping_planner_t::get_statistics()
            {
                PRX_WARN_S("Get statistics for manipulation tp is not implemented!");
                return new statistics_t();
            }

            void grasping_planner_t::link_specification(specification_t* new_spec)
            {
                input_specification = new_spec;
                
                if( input_specification->local_planner != NULL )
                    local_planner = input_specification->local_planner;
                else
                    PRX_WARN_S("No local planner has been specified in task planner " << path);
                
                if( input_specification->validity_checker != NULL )
                    validity_checker = input_specification->validity_checker;
                else
                    PRX_WARN_S("No validity checker has been specified in task planner " << path);

                if( input_specification->sampler != NULL )
                    sampler = input_specification->sampler;
                else
                    PRX_WARN_S("No sampler has been specified in task planner " << path);

                if( input_specification->metric != NULL )
                    metric = input_specification->metric;
                else
                    PRX_WARN_S("No distance metric has been specified in task planner " << path);
            }

            void grasping_planner_t::link_query(query_t* new_query)
            {
                grasping_query = dynamic_cast<grasping_query_t*>(new_query);
                if(grasping_query == NULL)
                    PRX_FATAL_S("The grasping planner operate only over a grasping query as input!");
            }

            void grasping_planner_t::setup()
            {
                PRX_INFO_S("Setup grasping planner ...");
            }

            bool grasping_planner_t::serialize()
            {
                //Do we need to serialize something???
                return true;
            }

            bool grasping_planner_t::deserialize()
            {
                //Here we should load all the grasping databases for the objects that we are interested in.
                return true;
            }

            bool grasping_planner_t::succeeded() const
            {
                return true;
            }

            bool grasping_planner_t::execute()
            {
                
                //Do we need execute??? 
                return true;
            }

            void grasping_planner_t::resolve_query()
            {
                //Here is all the fun
            }

            void grasping_planner_t::set_param(const std::string& path, const std::string& parameter_name, const boost::any& value)
            {
                std::string name;
                std::string subpath;
                boost::tie(name, subpath) = split_path(path);

                if( !name.empty() )
                    PRX_FATAL_S("Error! You are trying to set a parameter to a planner under grasping planner, where it is empty.");
                    
                set_param(parameter_name, value);
                
            }

            void grasping_planner_t::set_param(const std::string& parameter_name, const boost::any& value)
            {
                planner_t::set_param(parameter_name, value);
            }


// 			    void manipulation_tp_t::compute_posible_grasps(pose_t& pose, int number_of_grasps, int max_tries)
//             {
//                 PRX_FATAL_S("This Function Does now work!!!");
//                 for( int i = 0; i < number_of_grasps; ++i )
//                 {
//                     if( get_grasp(grasped_point, pose.state, max_tries) )
//                     {
//                         pose.grasped_set.push_back(mo_space->clone_point(grasped_point));
//                         pose.ungrasped_set.push_back(manip_state_space->clone_point(released_point));

//                         PRX_ASSERT(manip_state_space->equal_points(released_point, retract_path[0]));
//                         pose.retracted_set.push_back(manip_state_space->clone_point(retract_path.back()));

//                         //That is ok because state == control for rigid bodies.
//                         manip_state_space->copy_point_to_vector(released_point, manip_control_vec);
//                         manip_control_space->copy_vector_to_point(manip_control_vec, manip_ctrl);

//                         retract_plan.reverse();
//                         retract_plan.copy_onto_front(manip_ctrl, retract_plan[0].duration);
//                         // pose.reaching_plans.push_back(retract_plan);
//                         // pose.reaching_plans.back().reverse();
// //                        pose.retracting_plans.push_back(retract_plan);
// //                        pose.reaching_plans.push_back(plan_t());
// //                        pose.reaching_plans.back().reverse_plan(retract_plan);
// //                        PRX_ASSERT(pose.reaching_plans.back().size() == retract_plan.size());
//                     }
//                 }

//             }

//             bool manipulation_tp_t::get_grasp(sim::state_t* point, const sim::state_t* pose_state, int max_tries)
//             {
//                 PRX_FATAL_S("This Function Does now work!!!");
//                 int tries = -1;
//                 do
//                 {
//                     ++tries;
//                     if( tries >= max_tries )
//                         return false;

//                 }

//                 while( !manip_sampler->sample_near_object(point, pose_state) || !is_valid_grasp(point) );
//                 return true;
//             }

//             bool manipulation_tp_t::is_valid_grasp(state_t* point)
//             {
//                 config_t r_config = retraction_config;

//                 std::string old_context = model->get_current_context();
//                 model->use_context(pc_name_manipulator_with_object);
//                 if( !validity_checker->is_valid(point) )
//                     return false;

//                 //point has to be a grasped point that correspond to both manipulator configuration
//                 //and the pose of the object that the manipulator grasping.
//                 mo_space->copy_from_point(point);
//                 manip_state_space->copy_to_point(released_point);
//                 object_state_space->copy_to_point(object_state);

//                 released_point->memory.back() = 0;
//                 model->use_context(pc_name_manipulator_with_active_object);
//                 if( validity_checker->is_valid(released_point) )
//                 {
//                     //Because the manipulator should still be in the grasped state, this should be fine?
//                     _manipulator->get_end_effector_configuration( tmp_config );
//                     r_config.relative_to_global( tmp_config );

//                     retract_path.clear();
//                     retract_plan.clear();
//                     if( valid_move(retract_plan, retract_path, released_point, released_point, r_config) )
//                     {
//                         model->use_context(old_context);
//                         return true;
//                     }
//                 }
//                 model->use_context(old_context);
//                 return false;
//             }

//             bool manipulation_tp_t::valid_move(plan_t& plan, trajectory_t& path, const state_t* manip_start, const state_t* start, config_t & goal_config)
//             {
//                 // PRX_DEBUG_COLOR("Valid_Move to " << goal_config.print(), PRX_TEXT_BLUE);
//                 config_t start_config;

//                 const space_t* m_space = model->get_state_space();
//                 //Alright, have to do a little dancing here to make sure we keep the right state
//                 m_space->copy_to_point( manip_state );
//                 m_space->copy_from_point( manip_start );

//                 //And make sure we get the config of the manipulator here
//                 _manipulator->get_end_effector_configuration( start_config );

//                 if( _manipulator->IK_steering(start_config, goal_config, plan) )
//                 {
//                     //Restore the state
//                     m_space->copy_from_point( manip_state );
//                     // PRX_DEBUG_COLOR("Going to propagate : " << manip_state_space->serialize_point(manip_start, 5), PRX_TEXT_BROWN);
//                     local_planner->propagate(start, plan, path);
//                     if( path.size() != 0 && validity_checker->is_valid(path) )
//                         return true;
//                 }
//                 //Restore the state
//                 m_space->copy_from_point( manip_state );
//                 return false;
//             }
        }
    }
}
