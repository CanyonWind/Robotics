/**
 * @file application.hpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick 
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome,  Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */
#pragma once

#ifndef PRX_UTIL_DEMO_APPLICATION_HPP
#define	PRX_UTIL_DEMO_APPLICATION_HPP

#include "prx/utilities/applications/application.hpp"


#include <ros/ros.h>

namespace prx
{
    namespace util
    {


        /**
         * A demo application for prx_utilities
         * 
         * @brief <b> An organizer class for our applications. </b>
         * 
         * @authors Rahul Shome 
         */
        class demo_application_t : public application_t
        {

          public:
            demo_application_t();
            virtual ~demo_application_t();
            virtual void frame(const ros::TimerEvent& event);


        };


    }
}

#endif

