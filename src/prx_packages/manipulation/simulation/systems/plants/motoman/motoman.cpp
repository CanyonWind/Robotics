/**
 * @file motoman.cpp 
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

#include "simulation/systems/plants/motoman/motoman.hpp"

#include "prx/utilities/spaces/space.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"
#include "prx/simulation/simulators/simulator.hpp"
#include "prx/simulation/collision_checking/collision_checker.hpp"

#include <boost/tuple/tuple.hpp> // boost::tie
#include <boost/assign/list_of.hpp>
#include <boost/range/adaptor/map.hpp> //adaptors
#include <pluginlib/class_list_macros.h>
#include <urdf/model.h>
#include <time.h>
#include <iostream>
#include <fstream>
#include <sys/param.h>
#include <kdl_parser/kdl_parser.hpp>
#include <kdl/chainiksolverpos_nr_jl.hpp>
#include <kdl/chainiksolvervel_pinv.hpp>
#include <kdl/chainfksolverpos_recursive.hpp>
#include <kdl/chainidsolver_recursive_newton_euler.hpp>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::motoman_t, prx::sim::system_t)

namespace prx
{
    using namespace sim;
    using namespace util;
    namespace packages
    {
        namespace manipulation
        {
            motoman_t::motoman_t()
            {
                input_path = pracsys_path + "/prx_packages/manipulation/input/motoman/";
            }

            void motoman_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                manipulator_t::init(reader, template_reader);        
            }

            void motoman_t::create_spaces()
            {
                state_space = new space_t("Motoman", state_memory);
                input_control_space = new space_t("Motoman", control_memory);
            }
        }
    }
}