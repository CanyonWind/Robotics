
/**
 * @file motoman_left_mappings.cpp
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


#include "utilities/mapping_functions/motoman_left_mappings.hpp"
#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_torso_state_mapping_t, prx::util::mapping_function_t)
PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_torso_control_mapping_t, prx::util::mapping_function_t)
PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_arm_state_mapping_t, prx::util::mapping_function_t)
PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_arm_control_mapping_t, prx::util::mapping_function_t)
PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_gripper_state_mapping_t, prx::util::mapping_function_t)
PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_left_gripper_control_mapping_t, prx::util::mapping_function_t)