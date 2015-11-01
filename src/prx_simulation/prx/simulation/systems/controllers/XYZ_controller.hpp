/**
 * @file XYZ_controller.hpp 
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2014, Rutgers the State University of New Jersey, New Brunswick 
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#pragma once

#ifndef PRX_XYZ_CONTROLLER_HPP
#define PRX_XYZ_CONTROLLER_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/simulation/systems/system.hpp"
#include "prx/simulation/systems/controllers/simple_controller.hpp"
#include "prx/simulation/control.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/spaces/space.hpp"
#include "simulation/systems/plants/manipulator.hpp"

namespace prx
{
    namespace sim
    {

        class XYZ_controller_t : public simple_controller_t
        {

          public:
            XYZ_controller_t();

            /** @copydoc system_t::~system_t() */
            virtual ~XYZ_controller_t();

            virtual void init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader = NULL);

            virtual void compute_control();

            virtual void show_info_sphere(util::config_t config, double radius = 0.03);
            
          protected:
            packages::manipulation::manipulator_t* manipulator;
            util::config_t manipulator_ee_config;
            util::config_t last_successful_config;
        };
    }
}


#endif