/**
 * @file param_dump.cpp
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

#include "prx/utilities/spaces/space.hpp"
#include "prx/utilities/definitions/defs.hpp"
#include <fstream>
#include <iostream>
#include <ros/ros.h>
#include <ros/callback_queue.h>
// #include <boost/assign/list_of.hpp>


//Addons
#include "prx/utilities/communication/tf_broadcaster.hpp"
#include "prx/utilities/applications/application.hpp"

//Sim
#include "prx/utilities/parameters/parameter_reader.hpp"

// #include "prx/utilities/definitions/random.hpp"

#include <fstream>

// #include <boost/bind.hpp>
// #include <boost/program_options.hpp>
// using namespace boost::program_options;

using namespace prx::util;
using namespace std;


int main(int ac, char* av[])
{
    global_reader = NULL;
    std::string node_name;
    if (ac == 1)
    {
        PRX_FATAL_S("You must specify the simulation name in args i.e. args=simulation ");
    }
    else
    {
        node_name = av[1];
        // This skips the first 8 characters, which by default in ros is: __name:=
        std::string test = node_name.substr(0,8);
        if (test == "__name:=")
        {
            node_name = node_name.substr(8);
        }
    }
    PRX_INFO_S ("Util node name : " << node_name);
    
    // Initialize ROS. Call this node "simulation" when it spawns.
    ros::init(ac, av, node_name);
    ros::NodeHandle main_node_handle;

   

    
    
    
    parameter_reader_t* reader;

    reader = new parameter_reader_t(node_name);
     
    
    application_t* app = reader->create_from_loader<application_t > ("application", "prx_utilities");
    app->init(reader);
    
    ros::Timer sim_timer = main_node_handle.createTimer(ros::Duration(0.1), &application_t::frame, app);
    ros::Timer comm_timer = main_node_handle.createTimer(ros::Duration(0.05), &application_t::info_broadcasting, app);

    ros::getGlobalCallbackQueue()->callAvailable();
    ros::MultiThreadedSpinner spinner(4);
    spinner.spin();
        
        
    

    return 0;
}
