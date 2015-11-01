/**
 * @file grasping_query.hpp
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

#ifndef PRX_GRASPING_QUERY_HPP
#define PRX_GRASPING_QUERY_HPP

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
             * @anchor grasping_query_t
             *
             * This class is the query that the manipulation task planner will create for the grasping planner. 
             * It operates over a single object and the specific manipulator and end effector that the world model has active. 
             * It will return from the grasping planner all the information is needed for grasping the specific object at a given 
             * location. 
             *              * 
             * @brief <b> General query for the grasping planner. </b>
             *
             * @author Athanasios Krontiris
             */
            class grasping_query_t : public plan::query_t
            {

              public:                
                grasping_query_t();

                grasping_query_t(const util::space_t* state_space, const util::space_t* control_space, movable_body_plant_t* object_id, int grasping_id, sim::state_t* object_initial_state);
                
                virtual ~grasping_query_t();

                /**
                 * @brief Setup a new query for the grasping planner. 
                 * 
                 * @details Setup a new query for the grasping planner. This setup will delete the old plans 
                 * and paths and will initialize new ones with the give space. If the spaces are the same 
                 * then nothing will happen, but you could also had used the other setup function, provided by this class. 
                 * 
                 * @param state_space The state space for the trajectory.
                 * @param control_space The control space for the plan.
                 * @param object The object that we need to grasp.
                 * @param grasping_id The grasping id that we need to test.
                 * @param object_initial_state The initial state of the object.
                 */
                virtual void setup(const util::space_t* state_space, const util::space_t* control_space, movable_body_plant_t* object, int grasping_id, sim::state_t* object_initial_state);

                /**
                 * @brief Setup a new query for the grasping planner. 
                 * 
                 * @details Setup a new query for the grasping planner. If we are using the state and control spaces we do not 
                 * need to delete and relocate the trajectories and the plans. We just need to clean them. 
                 * 
                 * @param object The object that we need to grasp.
                 * @param grasping_id The grasping id that we need to test.
                 * @param object_initial_state The initial state of the object.
                 */
                virtual void setup(movable_body_plant_t* object_id, int grasping_id, sim::state_t* object_initial_state);

                /** 
                 * @copydoc motion_planning_query_t::clear() 
                 * 
                 * Its also clears the plans that the query has stored.
                 */
                virtual void clear();

                /** @brief The object that the manipulator will control. .*/
                movable_body_plant_t* object;

                /** @brief The initial state for the object that we need to grasp.*/
                sim::state_t* object_initial_state;

                /** 
                 * @brief The grasp id that we want to test for the object. 
                 * If is -1 will return the first grasp that it will work. 
                 * This variable will return the grasped id that worked if -1 then .
                 */
                int grasping_id; 

                /** @brief The grasping mode that the manipulator managed to grasp the object. */
                int grasping_mode;

                //------------------------//
                //--  Return Variables  --//
                //------------------------//
                /** @brief If the manipulation task planner found a path to our problem. */
                bool found_grasp;
                sim::state_t* releasing_state;
                sim::state_t* grasping_state;
                sim::state_t* retracted_open_state;
                sim::state_t* retracted_close_state;
                /** @brief The plan for reaching the object.*/
                sim::plan_t reaching_plan;
                /** @brief The plan for retracting from the object.*/
                sim::plan_t retracting_plan;
                /** @brief The path for reaching the object.*/
                sim::trajectory_t reaching_path;
                /** @brief The path for retracting from the object.*/
                sim::trajectory_t retracting_path;

            protected:
                const util::space_t* state_space;
                const util::space_t* control_space;
                
            };
        }
    }
}

#endif

