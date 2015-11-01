/**
 * @file geometry_sensor.hpp 
 * 
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2014, Rutgers the State University of New Jersey, New Brunswick  
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 * 
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Kostas Bekris 
 * 
 * Email: pracsys@googlegroups.com
 */
#pragma once

#ifndef PRX_GEOMETRY_SENSOR_HPP
#define PRX_GEOMETRY_SENSOR_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/boost/hash.hpp"
#include "prx/utilities/math/3d_geometry/geometry.hpp"
#include "prx/simulation/sensing/sensor.hpp"

namespace prx
{
    namespace util
    {
        class parameter_reader_t;
    }
    namespace sim
    {
        

        /**
         * @author Andrew Kimmel
         */
        class geometry_sensor_t : public sensor_t
        {
        protected:
            util::geom_map_t sensed_geometries;
        public:

            geometry_sensor_t();
            virtual ~geometry_sensor_t();
            
            /**
             * Initializes from the given parameters.
             * 
             * @brief Initializes from the given parameters.
             * 
             * @param reader A \ref util::parameter_reader_t with a dictionary of parameters for this system.
             * @param template_reader A template \ref util::parameter_reader_t with a dictionary of parameters.
             * Default value for the template reader is NULL. The priority goes to primary reader \c reader, if something
             * is not specified in the \c reader then it will be read from the \c template_reader 
             */
            virtual void init(const util::parameter_reader_t * reader, const util::parameter_reader_t* template_reader = NULL);
            virtual void initialize_sensor(simulator_t* sim);
            
            virtual void update_data(); // updates the internal sensing data (communication)
            virtual const util::geom_map_t& get_sensed_geometries();
            
        };

    }
}

#endif

