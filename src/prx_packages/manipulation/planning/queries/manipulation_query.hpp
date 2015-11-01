/**
 * @file manipulation_query.hpp
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
#pragma once

#ifndef PRX_MANIPULATION_QUERY_HPP
#define	PRX_MANIPULATION_QUERY_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/simulation/state.hpp"
#include "prx/simulation/plan.hpp"
#include "prx/simulation/trajectory.hpp"
#include "prx/planning/queries/query.hpp"

namespace prx
{
    namespace util
    {
        class parameter_reader_t;
    }

    namespace packages
    {
        namespace manipulation
        {

        	class movable_body_plant_t;

            /**
             * @anchor manipulation_query_t
             *
             * This class represents a problem that a manipulation task planner will have to solve.
             * It is a self-contained class which holds the manipulator that we want to use, the index of the 
             * end effector that we want to use, the initial state of the manipulator and the start/goal states 
             * for the object that we want to manipulate. This query is able to request a full pick and place action
             * or just a transit plan to the initial state of the object or a transfer path between the two positions.
             * 
             * It will return if found a path the plan that will solve the problem that the user has requested. Also, will
             * return the final state of the manipulator. 
             * 
             * @brief <b> General query for manipulation task planners. </b>
             *
             * @author Athanasios Krontiris
             */
            class manipulation_query_t : public plan::query_t
            {

              public:

              	/**
                 *   - Pick: From a open grasp state going to grasp a specific object at a pose.
                 *   - Place: From a grasping state we are going to place and retract the manipulator to a target position.
                 *   - Move: Find a path to move the manipulator for an initial state to a target state. The end effector can be either open or closed. 
                 */
                enum path_mode_t
                {
                    PRX_MOVE, PRX_PICK, PRX_PLACE, PRX_PICK_AND_PLACE
                };

                manipulation_query_t();

                manipulation_query_t(std::string manipulation_context_name, path_mode_t mode, movable_body_plant_t* object_id, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state, sim::state_t* object_initial_state, sim::state_t* object_target_state);

                virtual ~manipulation_query_t();

                virtual void setup(std::string manipulation_context_name, path_mode_t mode, movable_body_plant_t* object_id, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state, sim::state_t* object_initial_state, sim::state_t* object_target_state);

                virtual void setup_pick(std::string manipulation_context_name, movable_body_plant_t* object_id, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* object_initial_state);

                virtual void setup_place(std::string manipulation_context_name, movable_body_plant_t* object_id, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* object_initial_state, sim::state_t* object_target_state);

                virtual void setup_move(std::string manipulation_context_name, movable_body_plant_t* object_id, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state);

                /** 
                 * @copydoc motion_planning_query_t::clear() 
                 * 
                 * Its also clears the plans that the query has stored.
                 */
                virtual void clear();
                //* @brief The planning context that we are going to plan in. */
                std::string manipulation_context_name;
                /** @brief Declares the mode for the manipulation planning. 
                 *
                 *  Requests:
                 *   - Pick: From a open grasp state going to grasp a specific object at a pose.
                 *   - Place: From a grasping state we are going to place and retract the manipulator to a target position.
                 *   - Move: Find a path to move the manipulator for an initial state to a target state. The end effector can be either open or closed. 
                 */
                path_mode_t mode;

                /** @brief the initial state of the manipulator in the planning context.*/
                sim::state_t* manipulator_initial_state;
                /** @brief the target state of the manipulator in the planning context.*/
                sim::state_t* manipulator_target_state;
                
                /** @brief The initial state for the object that we need to grasp.*/
                sim::state_t* object_initial_state;
                /** @brief The target state for the object to be placed*/
                sim::state_t* object_target_state;

                /** @brief The object that the manipulator will control. .*/
                movable_body_plant_t* object;
                /** 
                 * @brief The grasp id that we want to test for the object. 
                 * If is -1 will return the first grasp that it will work. 
                 * This variable will return the grasped id that worked if -1 then .
                 */
                int grasping_id; 

                //------------------------//
                //--  Return Variables  --//
                //------------------------//
                /** @brief If the manipulation task planner found a path to our problem. */
                bool found_path;
                /** @brief The plan that solves the problem that we specified to the manipulation task planner.*/
                sim::plan_t plan;
                /** @brief The path that solves the problem that we specified to the manipulation task planner.*/
                sim::trajectory_t path;
                /** @brief Stores final state of the manipulator. Where the manipulator end up being after completing the task.*/
                sim::state_t* manipulator_final_state;
            };
        }
    }
}

#endif

