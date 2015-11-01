/**
 * @file application.cpp
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

#include "prx/utilities/applications/demo_app.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/string_manip.hpp"

#include "prx/utilities/communication/tf_broadcaster.hpp"

// #include <boost/range/adaptor/map.hpp> //adaptors
#include <fstream>
#include "prx/utilities/definitions/sys_clock.hpp"
#include <pluginlib/class_list_macros.h>
#include "prx_utilities/send_plants_srv.h"
#include "prx/utilities/definitions/random.hpp"
#include <boost/assign/list_of.hpp>

PLUGINLIB_EXPORT_CLASS(prx::util::demo_application_t, prx::util::application_t)

namespace prx
{

    namespace util
    {

        demo_application_t::demo_application_t()
        {}

        demo_application_t::~demo_application_t()
        {}
        
        /*
        The frame function is invoked 10 times per second.
        state_space is the SE3 space of the system
        point is a space_point which can be used to take snapshots of the state_space
        frame_number is a variable that monotonically increases with the number of frames 
        */
        void demo_application_t::frame(const ros::TimerEvent& event)
        {
            application_t::frame(event); // Invokes the superclass frame function that increments the frame_number
            state_space->copy_to_point(point); //Copying the current state space into the point
            // The point can be modified by point->at(index). For SE3 point has 7 dimensions - 3 position and 4 quaternion.
            // ************** ANY CHANGE OF CODE SHOULD PROBABLY GO IN THIS BLOCK ****************
            point->at(0) += uniform_random(-1,1); // uniform_random randomly samples a double in the range
            point->at(1) += uniform_random(-1,1); // x and y axis can increase or decrease
            point->at(2) += uniform_random(0,1); // z axis can only increase
            // ************** ANY CHANGE OF CODE SHOULD PROBABLY GO IN THIS BLOCK ****************
            state_space->copy_from_point(point); // The modified point does not affect the state space unless it is copied over.

        }


    }
}

