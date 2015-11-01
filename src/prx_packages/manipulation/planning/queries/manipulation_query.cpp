/**
 * @file manipulation_query.cpp
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

#include "planning/queries/manipulation_query.hpp"
#include "simulation/systems/plants/movable_body_plant.hpp"

#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/goals/goal.hpp"


#include <pluginlib/class_list_macros.h> 
#include <ros/ros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::manipulation_query_t, prx::plan::query_t)

namespace prx
{
    using namespace util;
    using namespace sim;

    namespace packages
    {
        namespace manipulation
        {

            manipulation_query_t::manipulation_query_t()
            {
            	
                manipulation_context_name = "";
                mode = PRX_MOVE;                
                manipulator_initial_state = NULL;
                manipulator_target_state = NULL;
                object_initial_state = NULL;
                object_target_state = NULL;
                object = NULL;
                grasping_id = -1;
                found_path = false;                
            }

            manipulation_query_t::manipulation_query_t(std::string manipulation_context_name, path_mode_t mode, movable_body_plant_t* object, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state, sim::state_t* object_initial_state, sim::state_t* object_target_state)
            {
            	setup(manipulation_context_name,mode,object,grasping_id,manipulator_initial_state,manipulator_target_state,object_initial_state,object_target_state);
            }

            manipulation_query_t::~manipulation_query_t()
            {
                clear();
            }

            void manipulation_query_t::setup(std::string manipulation_context_name, path_mode_t mode, movable_body_plant_t* object, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state, sim::state_t* object_initial_state, sim::state_t* object_target_state)
            {
            	this->manipulation_context_name = manipulation_context_name;
            	this->mode = mode;
            	this->object = object;
            	this->grasping_id = grasping_id;
            	this->manipulator_initial_state = manipulator_initial_state;
            	this->manipulator_target_state = manipulator_target_state;
            	this->object_initial_state = object_initial_state;
            	this->object_target_state = object_target_state;
                found_path = false;
            }

            void manipulation_query_t::setup_pick(std::string manipulation_context_name, movable_body_plant_t* object, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* object_initial_state)
            {
            	setup(manipulation_context_name,PRX_PICK,object,grasping_id,manipulator_initial_state,NULL,object_initial_state,NULL);
            }

            void manipulation_query_t::setup_place(std::string manipulation_context_name, movable_body_plant_t* object, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* object_initial_state, sim::state_t* object_target_state)
            {
            	setup(manipulation_context_name,PRX_PLACE,object,grasping_id,manipulator_initial_state,NULL,object_initial_state,object_target_state);
            }

            void manipulation_query_t::setup_move(std::string manipulation_context_name, movable_body_plant_t* object, int grasping_id, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state)
            {
            	setup(manipulation_context_name,PRX_MOVE,object,grasping_id,manipulator_initial_state,manipulator_target_state,NULL,NULL);
            }


            void manipulation_query_t::clear()
            {            	
                manipulation_context_name = "";
                manipulator_initial_state = NULL;
                manipulator_target_state = NULL;
                object_initial_state = NULL;
                object_target_state = NULL;
                object = NULL;
                grasping_id = -1;
                found_path = false;
            }
        }
    }
}
