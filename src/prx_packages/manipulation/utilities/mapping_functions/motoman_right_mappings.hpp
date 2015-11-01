
/**
 * @file motoman_right_mappings.hpp
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

#ifndef PRX_MOTOMAN_RIGHT_MAPPINGS_HPP
#define PRX_MOTOMAN_RIGHT_MAPPINGS_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/spaces/mapping_functions/subset_mapping.hpp"

#include <boost/assign/list_of.hpp>

namespace prx
{
    namespace packages
    {
        namespace manipulation
        {

        	///right Arm + torso
        	class motoman_right_torso_state_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_torso_state_mapping_t() 
		            {
		                domain = 18;
		                range = 8;
		                mapped_indices = boost::assign::list_of(0)(9)(10)(11)(12)(13)(14)(15);
		                output_space_name = "MotomanRight";
		                mapping_name = "motoman_right_torso_state_mapping";
		            }
		            virtual ~motoman_right_torso_state_mapping_t() {}
        	};

        	//right Arm
        	class motoman_right_arm_state_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_arm_state_mapping_t() 
		            {
		                domain = 18;
		                range = 7;
		                mapped_indices = boost::assign::list_of(9)(10)(11)(12)(13)(14)(15);
		                output_space_name = "MotomanRightArm";
		                mapping_name = "motoman_right_arm_state_mapping";
		            }
		            virtual ~motoman_right_arm_state_mapping_t() {}
        	};

        	//right Gripper
        	class motoman_right_gripper_state_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_gripper_state_mapping_t() 
		            {
		                domain = 18;
		                range = 1;
		                mapped_indices = boost::assign::list_of(17);
		                output_space_name = "Hand";
		                mapping_name = "motoman_right_gripper_state_mapping";
		            }
		            virtual ~motoman_right_gripper_state_mapping_t() {}
        	};

        	class motoman_right_torso_control_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_torso_control_mapping_t() 
		            {
		                domain = 18;
		                range = 8;
		                mapped_indices = boost::assign::list_of(0)(9)(10)(11)(12)(13)(14)(15);
		                output_space_name = "MotomanRight";
		                mapping_name = "motoman_right_torso_control_mapping";
		            }
		            virtual ~motoman_right_torso_control_mapping_t() {}
        	};

        	class motoman_right_arm_control_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_arm_control_mapping_t() 
		            {
		                domain = 18;
		                range = 7;
		                mapped_indices = boost::assign::list_of(9)(10)(11)(12)(13)(14)(15);
		                output_space_name = "MotomanRightArm";
		                mapping_name = "motoman_right_arm_control_mapping";
		            }
		            virtual ~motoman_right_arm_control_mapping_t() {}
        	};

        	class motoman_right_gripper_control_mapping_t : public util::subset_mapping_t
        	{
		        public:
		            motoman_right_gripper_control_mapping_t() 
		            {
		                domain = 18;
		                range = 1;
		                mapped_indices = boost::assign::list_of(17);
		                output_space_name = "Hand";
		                mapping_name = "motoman_right_gripper_control_mapping";
		            }
		            virtual ~motoman_right_gripper_control_mapping_t() {}
        	};
        }
    }
}

#endif