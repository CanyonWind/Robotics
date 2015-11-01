
/**
 * @file manipulator.hpp
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

#ifndef PRX_MANIPULATOR_HPP
#define PRX_MANIPULATOR_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/boost/hash.hpp"
#include "prx/simulation/state.hpp"
#include "prx/simulation/control.hpp"
#include "prx/simulation/trajectory.hpp"
#include "prx/simulation/plan.hpp"
#include "prx/simulation/systems/plants/integration_plant.hpp"

#include <kdl_parser/kdl_parser.hpp>
#include <algorithm>
namespace prx
{
    #define GRIPPER_CLOSED 1
    #define GRIPPER_OPEN 0

    namespace packages
    {

        namespace manipulation
        {
            /**
             * @brief A node for our manipulator's tree structure
             * @details A node for our manipulator's tree structure.
             * 
             */
            class manip_node_t
            {
                public:
                    manip_node_t()
                    {
                        memory = NULL;
                        children.clear();
                        physical_geoms = true;
                        parent = NULL;
                    }
                    bool physical_geoms;
                    double* memory;
                    unsigned state_index;
                    KDL::SegmentMap::const_iterator kdl_node;

                    manip_node_t* parent;
                    std::vector<manip_node_t*> children;
            };

            /**
             * @brief <b> The base abstract class for the manipulator.</b>
             * 
             * @details The base abstract class for the manipulator.
             *
             * @author Zakary Littlefield, Athanasios Krontiris
             *
             */
            class manipulator_t : public sim::integration_plant_t
            {

              public:

                manipulator_t();

                virtual ~manipulator_t();

                /** @copydoc plant_t::init(const util::parameter_reader_t *, const util::parameter_reader_t*) */
                void init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader);

                /** @copoydoc plant_t::update_phys_configs(util::config_list_t&, unsigned&) const */
                virtual void update_phys_configs(util::config_list_t& configs, unsigned& index) const;

                virtual void link_collision_info(sim::collision_checker_t* collision_checker);
                
                virtual void update_collision_info();
                
                virtual void steering_function(const sim::state_t* start, const sim::state_t* goal, sim::plan_t& result_plan);


                /**
                 * @brief Get the name of the end effector at place \c index, in case the manipulator 
                 * has more than one end effector.
                 * 
                 * @details Get the name of the end effector at place \c index, in case the manipulator 
                 * has more than one end effector.
                 * 
                 * @param index The index in the list of the end effectors.
                 * @return The name of the end effector at the place index.
                 */
                virtual std::string get_end_effector_name(int index) const;
                /**
                 * @brief Returns all the names of the end effectors of the manipulator.
                 * @details Returns all the names of the end effectors of the manipulator.
                 * @return A list with all the names of the end effectors of the manipulator.
                 */
                virtual const std::vector<std::string>& get_end_effector_names() const;

                /**
                 * @brief Appends the names of the end effectors of the manipulator to the list \c names.
                 * 
                 * @details Appends the names of the end effectors of the manipulator to the list \c names.
                 * 
                 * @param names The vector that we want to append the names of the end effectors of the manipulator.                 
                 */
                virtual void get_end_effector_names(std::vector<std::string>& names);

                /**
                 * @brief Gets the parts of the robot that during grasping should not be checked for collisions.
                 * 
                 * 
                 * @details Gets the parts of the robot that during grasping should not be checked for collisions.
                 * For example the two fingers of the Baxter's hand might collide with the grasped object, but this
                 * collision should not be recognized as collision.
                 * 
                 * @params index The index in the list of the end effectors.
                 * 
                 * @return The vector with the parts that have to be removed from the collision list. 
                 */
                virtual std::vector<std::string> get_ignored_grasping_bodies(int index);

                /**
                 * @brief Return if the manipulator is in a grasping mode or not.
                 * @details Return if the manipulator is in a grasping mode or not.
                 * @return True if the manipulator is in the grasping mode, otherwise false. 
                 */
                virtual bool is_end_effector_closed(int index) const;

                /**
                 * @brief Forward Kinematic solver for a link of the manipulator.
                 * @details Forward Kinematic solver for the links of the manipulator. Given the current state of the manipulator
                 * this function will compute the configuration of the link that is being asked from the input parameter \c link_name.
                 * 
                 * @param link_config The returning variable with the computed configuration.
                 * @param link_name The name of the link of the manipulator that we want to compute the FK. 
                 */
                virtual void FK_solver( util::config_t& link_config, std::string link_name);

                /**
                 * @brief Inverse Kinematics solver for a link of the manipulator.
                 * @details Inverse Kinematics solver for a link of the manipulator. This function will compute the inverse kinematics 
                 * for the chain specified between the \c start_link and the \c end_link. 
                 * 
                 * @param result_state The resulting state of the IK solution. 
                 * @param start_state The initial state of the manipulator. From this state we can retrieve the starting configuration of the link 
                 * that we are interesting in solving IK for and the mode of the manipulator if it is grasping or not.  
                 * @param goal_config The goal configuration that we need to achieve.
                 * @param start_link The first link of the chain.
                 * @param end_link The last link of the chain. 
                 * @return True if the IK_solver found a solution, otherwise false.
                 */
                virtual bool IK_solver( util::space_point_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config, std::string start_link, std::string end_link);

                /**
                 * @brief Computes a plan between the start state and the goal config using IK_solver.
                 * 
                 * @details Computes a plan between the start state and the goal config using IK_solver. The IK_steering function first will set
                 * the robot to the starting state and then will retrieve the starting config and the mode of the manipulator (grasping/no grasping).
                 * It will interpolate between the start and goal config to find the intermediate configurations. Using IK_solver will compute 
                 * the states for the robot for each intermediate config.  
                 * 
                 * @param result_plan The plan that will bring the manipulator from the start state to the goal state.
                 * @param result_state The resulting state of the IK solution. 
                 * @param start_state The initial state of the manipulator. From this state we can retrieve the starting configuration of the link 
                 * that we are interesting in solving IK for and the mode of the manipulator if it is grasping or not.  
                 * @param goal_config The goal configuration that we need to achieve.
                 * @param start_link The first link of the chain.
                 * @param end_link The last link of the chain. 
                 * @return True if the IK_steering found a solution, otherwise false.
                 */
                virtual bool IK_steering( sim::plan_t& result_plan,  util::space_point_t* result_state, const util::space_point_t* start_state, const util::config_t& goal_config, std::string start_link, std::string end_link);

                /**
                 * @brief IK Fast solver for the manipulator.
                 * @details Inverse Kinematics Fast solver for a link of the manipulator. As a part of the project you can change this function to 
                 * use IK Fast. You can possibly change the interface as well.
                 * 
                 * @param result_state The resulting state of the IK solution.  
                 * @param goal_config The goal configuration that we need to achieve.
                 * @return True if the IK_solver found a solution, otherwise false.
                 */
                virtual bool IK_fast_solver( util::space_point_t* result_state, const util::config_t& goal_config);


              protected:
                std::vector< std::vector<std::string> > grasped_ignored;
                util::hash_t<std::string, std::vector<unsigned>* > chain_map;

                std::vector< std::string > tree_ordered_config_names;
                std::vector< std::string > tree_ordered_simple_names;
                std::vector< KDL::Frame > config_offsets;
                KDL::Frame root_frame;

                std::vector<std::pair<std::string, double> > ignored_dofs;
                std::vector<std::string> ignored_geoms;

                KDL::Tree* kdl_tree;
                manip_node_t* manip_tree;

                
                std::vector<std::string> effector_names;
                std::vector<double> end_effector_states;
                std::vector<double> end_effector_controls;

                sim::state_t* inter_st;

                std::string pracsys_path;
                std::string input_path;
                std::string urdf_file_name;

                double MAX_IK_STEP;
                double GRASP_STEP;

                /** @copoydoc plant_t::update_derivative (state_t* const) */
                virtual void update_derivative(sim::state_t * const result);

                virtual void create_spaces() = 0;


                /**
                 * @brief  Update the physical configurations in the tree order specified from \ref populate_config_names.
                 * 
                 * @param configs The returned config_name,config pairs
                 * @param index Number of currently used entries in \ref configs
                 * @param iter The currently examined node in the KDL tree
                 * @param parent_frame Coordinate transform for the parent link
                 * @param space_index Index into the state space (joint angles usually)
                 * @param name_index Index into the rigid body names.
                 */
                void update_phys_configs(util::config_list_t& configs, unsigned& index, manip_node_t* node, const KDL::Frame& parent_frame, unsigned& name_index) const;
            
                /**
                 * @brief  Update the physical configurations in the tree order specified from \ref populate_config_names.
                 * 
                 * @param iter The currently examined node in the KDL tree
                 * @param parent_frame Coordinate transform for the parent link
                 * @param space_index Index into the state space (joint angles usually)
                 * @param name_index Index into the rigid body names.
                 */
                void update_collision_info(manip_node_t* node, KDL::Frame& parent_frame, unsigned& name_index);

                /**
                 * @brief Create the correctly ordered list of rigid body names for collision checking.
                 * 
                 * @param iter The currently examined node in the KDL tree
                 */
                void populate_config_names(KDL::SegmentMap::const_iterator iter);

                /**
                 * @brief Populate the chain_map with all the fk-required chains.
                 * 
                 * @param iter The currently examined node in the KDL tree.
                 * @param node The currently examined node in our internal tree.
                 * @param state_indices Currently stored list of state indices for this branch.
                 */
                void populate_state_vectors(KDL::SegmentMap::const_iterator iter, manip_node_t* node, std::vector<unsigned> state_indices);

                /**
                 * @brief Get the state indices for a chain in the manipulation tree
                 * 
                 * @param start_link The beginning of the chain
                 * @param end_link The end link of the chain.
                 * 
                 * @return The vector of state indices for this chain.
                 */
                std::vector<unsigned>* get_state_indices(std::string start_link, std::string end_link);            
                
            };
        }
    }
}
#endif
