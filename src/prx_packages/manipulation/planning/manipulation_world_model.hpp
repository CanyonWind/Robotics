/**
 * @file manipulation_world_model.hpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2015, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#pragma once

#ifndef PRACSYS_MANIPULATION_WORLD_MODEL_HPP
#define PRACSYS_MANIPULATION_WORLD_MODEL_HPP

#include "prx/planning/world_model.hpp"
#include "simulation/systems/plants/manipulator.hpp"
#include "simulation/simulators/manipulation_simulator.hpp"

#include <pluginlib/class_loader.h>

namespace prx
{
    namespace packages
    {

        namespace manipulation
        {
            class manipulation_simulator_t;
            class movable_body_plant_t;
            class manipulator_t;

            /**
             * @anchor manipulation_world_model_t
             *
             * @ingroup planning
             *
             * This class represents a planner's view of the world, and is responsible for
             * reporting state information. The world model works closely with planning
             * modules for proper operations in manipulation.
             *
             * @brief <b> Abstract world representation class for planners used in manipulation problems. </b>
             *
             * @author Zakary Littlefield, Athanasios Krontiris
             */
            class manipulation_world_model_t : public plan::world_model_t
            {

              public:
                manipulation_world_model_t(){}

                virtual ~manipulation_world_model_t(){ }

                /**
                 * Initialize the world_model from the given parameters. Also performs a massive initialization
                 * procedure that involved subdividing the world state space into an embedded space for planning.
                 * This embedded space can perform the task of hiding certain systems from the planner for dynamic
                 * obstacle planning, or for planning for multiple systems in a decentralized way. This can also
                 * be used to create a task space, a typically lower dimensional space that captures the task that
                 * is being achieved.
                 *
                 * These things are accomplished through the use of the embedded space class.
                 *
                 * @param reader A \ref util::parameter_reader_t with a dictionary of parameters for this system.
                 * @param template_reader A secondary \ref util::parameter_reader_t with a dictionary of default parameters.
                 */
                virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader = NULL);


                /**
                 * Copy the given state over the world current state.
                 *
                 * The state must be compatible with the system's state space.
                 * All the implementations of systems have to enforce the bounds
                 * of the state space on the state that they just receive \c source.
                 *
                 * @param source A point from the simulator's state space.
                 */
                virtual void push_state(const sim::state_t * const source);

                /**
                 * @brief Space context switch function.
                 * 
                 * @details This function switches the context of the planning to work over a new
                 * space. This function loads a new \ref space_descriptor_t for planning. Also, uses 
                 * the correct manipulator and the correct end effector. 
                 * 
                 * @param name The name of the space which we want to plan for.
                 */
                virtual void use_context(std::string name);

                /**
                 * @brief Returns the list with all the objects that you can manipulate. 
                 * 
                 * @details Returns the list with all the objects that you can manipulate. 
                 * These objects have an identifier type that the grasping module knows for computing the correct relative configurations for this object.
                 */
                virtual void get_objects(std::vector<movable_body_plant_t* >& objects);

                /**
                 * @brief  This function can set the relative configuration to be static between the manipulator and the grasped object.
                 * 
                 * @details This function can set the relative configuration to be static between the manipulator and the grasped object. 
                 * You have to make sure when you call this function that the object is actually grasped by the corresponding end-effector. 
                 * Otherwise, the object will be flying together as the arm moves without being grasped. 
                 * We don't have to specify the manipulator because this is already specified by the manipulation context.
                 * 
                 * @param flag True if we want to keep the relative configuration static (e.g. when we are moving the manipulator with an object grasped). 
                 * Be CAREFUL: You have to be sure that the manipulator is grasping the object, otherwise the relative configuration will be off.
                 */
                virtual void set_static_relative_config( bool flag);
                
                /**
                 * @brief this function uses the end-effector context in order to generate the control 
                 * which results in grasping or releasing.
                 * 
                 * @details this function uses the end-effector context in order to generate the control 
                 * which results in grasping or releasing. It appends to the input plan the control pulse 
                 * that performs the grasp/release.
                 * 
                 * @param plan The plan with the controls we need in order to achieve the grasping mode.
                 * @param grasping_mode The mode that we want the end effector to be (e.g. 1 for open end effector, 2 for closed end effector). 
                 * We could have multiple modes for grasping and open end effectors.
                 */
                virtual void engage_grasp( sim::plan_t& plan, int grasping_mode );

                
                /**
                 * @brief This function calls IK for the specific manipulation context.
                 * 
                 * @details This function calls IK for the specific manipulation context.
                 * 
                 * @param result_state The resulting state of the IK solution. 
                 * @param start_state The initial state of the manipulator. From this state we can retrieve the starting configuration of the link 
                 * that we are interesting in solving IK for and the mode of the manipulator if it is grasping or not.  
                 * @param goal_config The goal configuration that we need to achieve.
                 * 
                 * @return True if the IK_solver found a solution, otherwise false.
                 */
                virtual bool IK( sim::state_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config);

                
                /**
                 * @brief This function calls IK_steering for the manipulation context.
                 * @details This function calls IK_steering for the manipulation context.
                 * 
                 * @param result_plan The plan that will bring the manipulator from the start state to the goal state.
                 * @param result_state The resulting state of the IK solution. 
                 * @param start_state The initial state of the manipulator. From this state we can retrieve the starting configuration of the link 
                 * that we are interesting in solving IK for and the mode of the manipulator if it is grasping or not.  
                 * @param goal_config The goal configuration that we need to achieve.
                 * @return True if the IK_steering found a solution, otherwise false.
                 */
                virtual bool IK_steering( sim::plan_t& result_plan, sim::state_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config);

                
                /**
                 * @brief It will return the configuration of the last link along the active chain per the manipulation context.
                 * @details It will return the configuration of the last link along the active chain per the manipulation context.
                 * 
                 * @param link The result configuration for the last link along the chain. 
                 */
                virtual void FK(util::config_t& link);
                
                /**
                 * @brief Returns the first link and the end link for the chain that the specific manipulation context is working on. 
                 * 
                 * @details Returns the first link and the end link for the chain that the specific manipulation context is working on. 
                 * Hopefully, it will not be necessary to reason over chains above the world model. 
                 * But it may end up being necessary for certain projects.
                 * 
                 * @return Returns the first link and the end link for the chain that the specific manipulation context is working on. 
                 */
                virtual std::pair<std::string, std::string> get_chain();
                
                /**
                 * @brief Returns the end effector context that only the specific end effector is active.
                 * 
                 * @details Returns the end effector context that only the specific end effector is active. 
                 * Hopefully, it will not be necessary to reason over end effector contexts above the world model. 
                 * But it may end up being necessary for certain projects.
                 * 
                 * @return Returns the end effector context that only the specific end effector is active.
                 */
                virtual std::string get_end_effector_context();

                
                /**
                 * @brief You can get the manipulators but you most probably won't need that in most cases.
                 * @details You can get the manipulators but you most probably won't need that in most cases.
                 * 
                 * @param manipulators Appends to this vector all the manipulators that are in the world.
                 */
                virtual void get_manipulators(std::vector<manipulator_t* >& manipulators);

            protected:
                manipulation_simulator_t* manip_simulator;

            };
        }
    }
}

#endif
