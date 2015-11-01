/**
 * @file main.cpp 
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


#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/simulation/applications/application.hpp"

#include "prx/utilities/definitions/random.hpp"

#include <fstream>

#include <boost/bind.hpp>
#include <boost/assign/list_of.hpp>
#include <boost/program_options.hpp>
#include <ros/ros.h>
#include <ros/callback_queue.h>

#include "simulation/systems/plants/baxter/baxter.hpp"
#include "utilities/mapping_functions/baxter_left_mappings.hpp"
#include "prx/utilities/definitions/defs.hpp"

using namespace prx::util;
using namespace prx::sim;
using namespace boost::program_options;
using namespace prx::packages::manipulation;

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
    PRX_ERROR_S ("Simulation node name : " << node_name);
    
    // Initialize ROS. Call this node "simulation" when it spawns.
    ros::init(ac, av, node_name);
    ros::NodeHandle main_node_handle;

    // Wait for parameter setting scripts to finish.
    while( ros::param::has("prx/parameter_mutex") )
    {
    }

    
    
    
    std::string init_name = "prx/initialization/";
    init_name+=node_name;
    ros::param::set(init_name,true);    
    sleep(1);
    if (ros::param::has("prx/initialization/order"))
    {
        parameter_reader_t init_reader("prx/initialization/");
        //make sure nothing comes before this
        std::vector<std::string> node_list = init_reader.get_attribute_as<std::vector<std::string> >("order");
        unsigned pos=node_list.size();
        for(unsigned i=0;i<pos;i++)
        {
            if(node_list[i]==node_name)
                pos = i;
        }
        for(unsigned i=0;i<pos;i++)
        {
            while (ros::param::has("prx/initialization/"+node_list[i]))
            {
                sleep(1);
            }
        }
    }
    else
    {
        //assume waiting on a node called visualization        
        while (ros::param::has("prx/initialization/visualization")) {}
    }
    
    
    parameter_reader_t* reader;

    reader = new parameter_reader_t(node_name);
    
    baxter_t* baxter = (baxter_t*) parameters::initialize_from_loader<system_t> ("prx_simulation", reader, "baxter", NULL, "");
    
    baxter_left_arm_state_mapping_t mapping;
    mapping.preimage_space = (space_t*)baxter->get_state_space();
    mapping.init_spaces();

    //State space of the entire Baxter - Left arm:Right arm:Grippers
    const space_t* baxter_left_arm_space = mapping.image_space;
    //State space of the left arm of the Baxter - Left arm
    const space_t* baxter_full_space = baxter->get_state_space();

    //A point in the full state space of Baxter
    state_t* full_point = baxter_full_space->alloc_point();
    //A point in the left hand space of Baxter
    state_t* left_arm_point = baxter_left_arm_space->alloc_point();
    //A Configuration in SE3
    config_t end_effector_config;

    //TODO:::
    // KDL IK can be called using
    // baxter->IK_solver( full_point, full_point, end_effector_config, "base", "end_effector_left" )
    // Implement IK Fast in the baxter plant and call it using
    // baxter->IK_fast_solver( full_point, end_effector_config )
    // Get the desired statistics 
    PRX_DEBUG_COLOR("Statistics! ",PRX_TEXT_MAGENTA);


    return 0;
}
