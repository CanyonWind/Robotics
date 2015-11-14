/**
 * @file simple_pap_tp.hpp
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

#pragma once

#ifndef PRX_SIMPLE_PICK_AND_PLACE_TP_HPP
#define	PRX_SIMPLE_PICK_AND_PLACE_TP_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/sys_clock.hpp"
#include "prx/utilities/boost/hash.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/spaces/space.hpp"

#include "prx/simulation/plan.hpp"
#include "prx/simulation/trajectory.hpp"

#include "prx/planning/task_planners/task_planner.hpp"
#include "prx/planning/motion_planners/motion_planner.hpp"
#include "prx/planning/queries/query.hpp"
#include "prx/planning/problem_specifications/specification.hpp"
#include "prx/planning/queries/motion_planning_query.hpp"

#include "planning/manipulation_world_model.hpp"
#include "planning/queries/manipulation_query.hpp"
#include "std_msgs/String.h"
#include "ros/ros.h"

namespace prx
{
    namespace packages
    {
        namespace manipulation
        {
            
            /**
             * A task planner for testing the manipulation task planner. This task planner executes a simple pick and place. 
             *
             * @authors Athanasios Krontiris
             */
            class simple_pap_tp_t : public plan::task_planner_t
            {

              public:

                simple_pap_tp_t();
                virtual ~simple_pap_tp_t();

                virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader);

                /** @copydoc motion_planner_t::link_world_model(world_model_t* const) */
                void link_world_model(plan::world_model_t * const model);

                /** @copydoc planner_t::link_query(query_t*) */
                virtual void link_query(plan::query_t* new_query);

                /** @copydoc motion_planner_t::setup() */
                virtual void setup();

                /** @copydoc motion_planner_t::execute() */
                virtual bool execute();

                /** @copydoc motion_planner_t::succeeded() const */
                virtual bool succeeded() const;

                /** @copydoc motion_planner_t::get_statistics() */
                virtual const util::statistics_t* get_statistics();

                virtual void resolve_query();

                void manipulation_request_callback(const std_msgs::String::ConstPtr& msg);

                void set_wait_for_manipulation(bool wait_manip)
                {
                    waiting_for_manipulation_plan_end = wait_manip;
                }

              protected:

                manipulation_world_model_t* manipulation_model;
                manipulator_t* manipulator;
                sim::state_t* manip_initial_state;

                /** @brief The input manipulation query */
                manipulation_query_t* manipulation_query;

                plan::motion_planning_query_t* in_query;

                std::string full_manipulator_context_name;
                std::string manipulation_context_name;
                std::string manipulation_task_planner_name;
                std::vector<double> object_target_vec;
                ros::Subscriber manipulation_request_subscriber;
                ros::Publisher ready_to_plan_publisher;
                ros::NodeHandle node;
                bool waiting_for_manipulation_plan_end;
                int number_of_manipulations;
		std::vector<double> elapsed_times;
		std::vector<bool> success_or_not;

            };
        }
    }
}


#endif
