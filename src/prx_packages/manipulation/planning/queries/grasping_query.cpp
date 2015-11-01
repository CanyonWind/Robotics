/**
 * @file grasping_query.cpp
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

#include "planning/queries/grasping_query.hpp"
#include "simulation/systems/plants/movable_body_plant.hpp"

#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/goals/goal.hpp"


#include <pluginlib/class_list_macros.h> 
#include <ros/ros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::grasping_query_t, prx::plan::query_t)

namespace prx
{
    using namespace util;
    using namespace sim;

    namespace packages
    {
        namespace manipulation
        {

            grasping_query_t::grasping_query_t()
            {
            	clear();
            }

            grasping_query_t::grasping_query_t(const util::space_t* state_space, const util::space_t* control_space, movable_body_plant_t* object, int grasping_id, sim::state_t* object_initial_state)
            {
            	setup(state_space, control_space, object, grasping_id, object_initial_state);
            }

            grasping_query_t::~grasping_query_t()
            {
                clear();
            }

            void grasping_query_t::setup(const util::space_t* in_state_space, const util::space_t* in_control_space, movable_body_plant_t* object, int grasping_id, sim::state_t* object_initial_state)
            {
                if(state_space != in_state_space)
                {
                    if(state_space != NULL)
                    {
                        state_space->free_point(releasing_state);
                        state_space->free_point(grasping_state);
                        state_space->free_point(retracted_open_state);
                        state_space->free_point(retracted_close_state);
                    }
                    state_space = in_state_space;

                    releasing_state = state_space->alloc_point();
                    grasping_state = state_space->alloc_point();
                    retracted_open_state = state_space->alloc_point();
                    retracted_close_state = state_space->alloc_point();
                    reaching_path.link_space(state_space);
                    retracting_path.link_space(state_space);
                }

                if(control_space != in_control_space)
                {
                    reaching_plan.link_control_space(control_space);
                    retracting_plan.link_control_space(control_space);
                    control_space = in_control_space;
                }

                setup(object,grasping_id,object_initial_state);
            }

            void grasping_query_t::setup(movable_body_plant_t* object_id, int grasping_id, sim::state_t* object_initial_state)
            {
            	this->object = object;
            	this->grasping_id = grasping_id;
            	this->object_initial_state = object_initial_state;
                reaching_path.clear();
                retracting_path.clear();
                reaching_plan.clear();
                retracting_plan.clear();
                found_grasp = false;
            }

            void grasping_query_t::clear()
            {
                if(state_space != NULL)
                {
                    state_space->free_point(releasing_state);
                    state_space->free_point(grasping_state);
                    state_space->free_point(retracted_open_state);
                    state_space->free_point(retracted_close_state);
                }
                state_space = NULL;
                control_space = NULL;
                object = NULL;
                object_initial_state = NULL;
                grasping_id = -1;
                found_grasp = false;
                //We don't have to delete the points because both plans and trajectories have the state space 
                //and the control space stored internally. When you link a new state or control space they both
                //going to delete the points and initialize new ones.
                reaching_path.clear();
                retracting_path.clear();
                reaching_plan.clear();
                retracting_plan.clear();
            }
        }
    }
}
