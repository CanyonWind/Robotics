// /**
//  * @file urdf_plant.hpp
//  *
//  * @copyright Software License Agreement (BSD License)
//  * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
//  * All Rights Reserved.
//  * For a full description see the file named LICENSE.
//  *
//  * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Rahul Shome, Zakary Littlefield, Kostas Bekris
//  *
//  * Email: pracsys@googlegroups.com
//  */
// #pragma once

#pragma once

#ifndef PRX_BAXTER_HPP
#define	PRX_BAXTER_HPP

#include "prx/utilities/definitions/defs.hpp"

#include "simulation/systems/plants/manipulator.hpp"

namespace prx
{
    namespace packages
    {
        namespace manipulation
        {

            /**
             * 
             */
            class baxter_t : public manipulator_t
            {

              public:
                baxter_t();

                virtual ~baxter_t(){ }

                /** @copydoc plant_t::init(const util::parameter_reader_t *, const util::parameter_reader_t*) */
                virtual void init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader = NULL);

                virtual bool IK_fast_solver( util::space_point_t* result_state, const util::config_t& goal_config);

              protected:

                virtual void create_spaces();
            };
        }

    }
}

#endif