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

#include "prx/utilities/applications/application.hpp"
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

PLUGINLIB_EXPORT_CLASS(prx::util::application_t, prx::util::application_t)

namespace prx
{

    namespace util
    {

        pluginlib::ClassLoader<application_t> application_t::loader("prx_utilities", "prx::util::application_t");


        application_t::application_t()
        {
            tf_broadcaster = NULL;


        }

        application_t::~application_t()
        {
            delete tf_broadcaster;
        }

        void application_t::init(const parameter_reader_t * const reader)
        {
            
            std::string plugin_type_name;
            
            tf_broadcaster = new tf_broadcaster_t;

            PRX_INFO_S(reader->has_element("relative_configuration"));

            relative_config = *(reader->initialize_new<config_t > ("relative_configuration"));

            PRX_INFO_S("Config "<<relative_config.print());
            ros::ServiceClient client = node.serviceClient<prx_utilities::send_plants_srv > ("visualization/plants");
            prx_utilities::send_plants_srv srv;

            srv.request.source_node_name = "utilities";

            
            srv.request.paths.push_back("simulator/disk");


            client.waitForExistence(ros::Duration(5));

            if( !client.call(srv) )
            {
                PRX_ERROR_S("Service request to send plants failed.  Ignoring.");
            }
            frame_number = 0;


            _x = _y = _z = _qx = _qy = _qz = 0;
            _qw = 1;
            std::vector<double*> state_memory = boost::assign::list_of(&_x)(&_y)(&_z)(&_qx)(&_qy)(&_qz)(&_qw);
            state_space = new space_t("SE3", state_memory);
            state_space->get_bounds()[0]->set_bounds(-100, 100);
            state_space->get_bounds()[1]->set_bounds(-100, 100);
            state_space->get_bounds()[2]->set_bounds(0, 100);
            point = state_space->alloc_point();
            
        }
        
        void application_t::frame(const ros::TimerEvent& event)
        {
            frame_number++;
        }

        void application_t::tf_broadcasting()
        {
            PRX_ASSERT(tf_broadcaster != NULL);
            config_list_t config_map;
            unsigned index = 0;
            
            conf.set_position(_x,_y,_z);
            conf.set_orientation(_qx,_qy,_qz,_qw);

            tf_broadcaster->queue_config(conf, "simulator/disk/ball");
            config_t new_config = relative_config;
            new_config.relative_to_global(conf);
            tf_broadcaster->queue_config(new_config, "simulator/disk/rod");

            tf_broadcaster->broadcast_configs();

        }

        void application_t::info_broadcasting(const ros::TimerEvent& event)
        {
            tf_broadcasting();
        }

        pluginlib::ClassLoader<application_t>& application_t::get_loader()
        {
            return loader;
        }

    }
}

