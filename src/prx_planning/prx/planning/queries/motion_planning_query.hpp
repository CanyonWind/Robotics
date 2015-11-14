/**
 * @file motion_planning_query.hpp
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

#ifndef PRX_PLANNING_QUERY_HPP
#define	PRX_PLANNING_QUERY_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/simulation/plan.hpp"
#include "prx/simulation/state.hpp"
#include "prx/simulation/trajectory.hpp"
#include "prx/planning/queries/query.hpp"

namespace prx
{
    namespace util
    {
        class parameter_reader_t;
        class goal_t;
    }

    namespace plan
    {

        class stopping_criteria_t;

        /**
         * @anchor motion_planning_query_t
         *
         * This class represents a problem instance to be solved by a motion planner.
         * It is a self-contained class which holds the start/goal pair as well as has
         * storage for answering trajectories and plans.
         *
         * @brief <b> General query for motion planners. </b>
         *
         * @author Athanasios Krontiris
         */
        class motion_planning_query_t : public query_t
        {
          public:
            
            enum query_type_t
            {
                PRX_ADD_QUERY_POINTS_COLLISIONS, PRX_ADD_QUERY_POINTS_NO_COLLISIONS, PRX_NEAR_QUERY_POINTS
            };
            
            enum query_collision_type_t
            {

                PRX_NO_COLLISIONS, PRX_LAZY_COLLISIONS, PRX_ACTIVE_COLLISIONS_REUSE_EDGES, PRX_ACTIVE_COLLISIONS_REPROPAGATE_EDGES
            };
            
            motion_planning_query_t();
            virtual ~motion_planning_query_t();

            /**
             * @brief Initialize the planing query from input parameters.
             *
             * @param reader The reader for the parameters.
             * @param template_reader A template reader for reading template parameters 
             */
            virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader);

            /**
             * @brief Setups a new motion planning query.
             * @details Setups a new  motion planning query. This covers only the basic case where the query has only a single 
             * start and a singe goal. The user can select what kind of collision checking will happen and how the motion planner 
             * will treat the start and goal point.
             * 
             * @param start_state The start state.
             * @param goal_state The goal state.
             * @param q_collision_type What kind of collision checking we need for the motion planner to perform. 
             * @param q_type How the motion planner will treat the start and goal. 
             */
            virtual void setup(sim::state_t* start_state, sim::state_t* goal_state, query_collision_type_t q_collision_type, query_type_t q_type);

            /**
             * @brief Setups a new motion planning query.
             * @details Setups a new  motion planning query. This covers only the basic case where the query has only a single 
             * start and a singe goal. The user can select what kind of collision checking will happen and how the motion planner 
             * will treat the start and goal point.
             * 
             * For this version we should read the query type and the query collision type from input before we use this function. 
             * 
             * @param start_state The start state.
             * @param goal_state The goal state. 
             */
            virtual void setup(sim::state_t* start_state, sim::state_t* goal_state);

            /**
             * @brief Clear the plan and trajectory of this query.
             *
             * Clears the plan and the trajectory of the planning query in order to 
             * reuse the planning query with the same start and stopping criterion. 
             */
            virtual void clear();

            /**
             * @brief Returns the starting state for the query.
             *
             * @return The start state.
             */
            virtual sim::state_t* get_start_state() const;

            /**
             * @brief Returns the goal state for the query.
             *
             * @return The goal state.
             */
            virtual util::goal_t* get_goal() const;

            /**
             * @brief Links the state and control spaces that the planning query is working over.
             *
             * @param state_space The state space.
             * @param control_space The control space.
             */
            virtual void link_spaces(const util::space_t* state_space, const util::space_t* control_space);
            
            /**
             * 
             * @brief Copies the start state to the query.
             * 
             * The motion_planning_query_t has an internal state point that will copy
             * the given start state. It does not own the given state. The user has to
             * delete the given state later. 
             * 
             * @param start The state that will be coppied to the query.
             */
            virtual void copy_start(const sim::state_t* start);

            /**
             * @brief Set a group of start states.
             *
             * @param s_vec A vector containing start states to query from.
             */
            virtual void set_start_from_vector(const std::vector<double>& s_vec);

            /**
             * @brief Set the query goal state.
             *
             * The motion_planning_query_t will own this goal.Planning_query_t will
             * delete the goal at the end of the execution. 
             *
             * @param goal The util::goal_t that we want our query to end.
             */
            virtual void set_goal(util::goal_t* goal);

            /** @brief Computed plan which answers this query. */
            sim::plan_t plan;
            /** @brief Computed trajectory which answers this query. */
            sim::trajectory_t path;
            /** @brief State space over which this query is operating. */
            const util::space_t* state_space;
            /** @brief Control space over which this query is operating. */
            const util::space_t* control_space;
            /** @brief If we found a solution or not */
            bool found_solution;
            double solution_cost;
            
            query_collision_type_t q_collision_type;
            query_type_t q_type;
            
          protected:
            /** @brief Vector containing all possible start states in double form */ //TODO: Shouldn't this information be in sim::state_t* form?
            std::vector<double> start_vec;
            /** @brief Start state of the query. */
            sim::state_t* start_state;
            /** @brief Goal state of the query. */
            util::goal_t* goal;
        };
    }
}

#endif

