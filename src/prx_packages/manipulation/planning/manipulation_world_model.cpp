/**
 * @file manipulation_world_model.cpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2015, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Rahul Shome, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "planning/manipulation_world_model.hpp"
#include "simulation/simulators/manipulation_simulator.hpp"
#include "simulation/systems/plants/manipulator.hpp"
#include "simulation/systems/plants/movable_body_plant.hpp"

#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::manipulation_world_model_t, prx::plan::world_model_t)

namespace prx
{
    namespace packages
    {
        using namespace util;
        using namespace sim;
        using namespace plan;

        namespace manipulation
        {
            void manipulation_world_model_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                world_model_t::init(reader,template_reader);
                manip_simulator = dynamic_cast<manipulation_simulator_t*>(simulator);
                if(manip_simulator == NULL)
                    PRX_FATAL_S("Manipulation_world_model works only with manipulation_simulator_t!");
            }

            void manipulation_world_model_t::push_state(const sim::state_t * const source)
            {
                world_model_t::push_state(source);
            }

            void manipulation_world_model_t::use_context(std::string name)
            {
                world_model_t::use_context(name);
            }

            void manipulation_world_model_t::get_objects(std::vector<movable_body_plant_t* >& objects)
            {
                manip_simulator->get_movable_objects(objects);
            }

            void manipulation_world_model_t::set_static_relative_config( bool flag)
            {
                // manip_simulator->set_static_relative_config()
            }
            
            void manipulation_world_model_t::engage_grasp( plan_t& plan, int grasping_mode )
            {

            }

            bool manipulation_world_model_t::IK( sim::state_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config)
            {
                return false;
            }

            bool manipulation_world_model_t::IK_steering( plan_t& result_plan, sim::state_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config)
            {
                return false;
            }
            
            void manipulation_world_model_t::FK(util::config_t& link)
            {

            }
            
            std::pair<std::string, std::string> manipulation_world_model_t::get_chain()
            {
                return std::make_pair("","");
            }
            
            std::string manipulation_world_model_t::get_end_effector_context()
            {
                return "";
            }

            void manipulation_world_model_t::get_manipulators(std::vector<manipulator_t* >& manipulators)
            {
                manip_simulator->get_manipulators(manipulators);
            }
        }
    }
}