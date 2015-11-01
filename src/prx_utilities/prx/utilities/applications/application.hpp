/**
 * @file application.hpp
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

#ifndef PRX_UTIL_APPLICATION_HPP
#define PRX_UTIL_APPLICATION_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/definitions/sys_clock.hpp"
#include "prx/utilities/communication/tf_broadcaster.hpp"
#include <pluginlib/class_loader.h>
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/spaces/space.hpp"


#include <ros/ros.h>

namespace prx
{
    namespace util
    {


        /**
         * An organizer class for our application. It contains the simulator and keeps all the extra 
         * informations that we may need for our application.
         * 
         * @brief <b> An organizer class for our applications. </b>
         * 
         * @authors Andrew Kimmel, Athanasios Krontiris 
         */
        class application_t
        {

          public:
            application_t();
            virtual ~application_t();

            /**
             * Initializes from the given parameters.
             * 
             * @brief Initializes from the given parameters.
             * 
             * @param reader A \ref util::parameter_reader_t with a dictionary of parameters for this system.
             */
            virtual void init(const util::parameter_reader_t * const reader);
            
            void tf_broadcasting();
            virtual void frame(const ros::TimerEvent& event);

            /**
             * Broadcasts information for the extra geometries that are not the main systems.
             * Most of the time these extra configurations are for debugging/helper geometries that controllers
             * need to visualize. It will be triggered by the \ref ros::TimerEvent every 0.05 seconds.
             * 
             * @brief Broadcasts information for the extra geometries.
             * 
             * @param event A \ref ros::TimerEvent that will be occurred every 0.05 secods.
             */
            virtual void info_broadcasting(const ros::TimerEvent& event);

            /**
             * It returns a pluginlib class loader for the current class.
             * 
             * @brief It returns a plugin lib class loader for the current class.
             * 
             * @return The pluginlib loader for the current class.
             */
            static pluginlib::ClassLoader<application_t>& get_loader();


            static pluginlib::ClassLoader<application_t> loader;
          protected:

            tf_broadcaster_t* tf_broadcaster;
            ros::NodeHandle node;

            util::config_t conf;
            util::config_t relative_config;
            unsigned int frame_number;
            double _x,_y,_z,_qx,_qy,_qz,_qw;
            space_t* state_space;
            space_point_t* point;
            
        };


    }
}

#endif

