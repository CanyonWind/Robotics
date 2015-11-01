/**
 * @file motoman.hpp 
 * 
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2015, Rutgers the State University of New Jersey, New Brunswick 
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */
#pragma once

#ifndef PRX_MOTOMAN_HPP
#define	PRX_MOTOMAN_HPP

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
            class motoman_t : public manipulator_t
            {

              public:
                motoman_t();

                virtual ~motoman_t(){ }

                /** @copydoc plant_t::init(const util::parameter_reader_t *, const util::parameter_reader_t*) */
                virtual void init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader = NULL);

              protected:

                virtual void create_spaces();
            };
        }

    }
}

#endif
