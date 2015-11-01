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

#include "prx/utilities/distance_metrics/linear_metric/linear_distance_metric.hpp"
#include "prx/utilities/distance_metrics/graph_metric/graph_metric.hpp"
#include "prx/utilities/distance_metrics/ann_metric/ann_distance_metric.hpp"
#include "prx/utilities/spaces/space.hpp"
#include "prx/utilities/definitions/defs.hpp"
#include <fstream>
#include <iostream>
#include <ros/ros.h>
#include <ros/callback_queue.h>
#include <boost/assign/list_of.hpp>


//Addons
 #include "prx/utilities/communication/tf_broadcaster.hpp"


//Sim
#include "prx/utilities/parameters/parameter_reader.hpp"

#include "prx/utilities/definitions/random.hpp"

#include <fstream>

#include <boost/bind.hpp>
#include <boost/program_options.hpp>
using namespace prx::sim;
using namespace boost::program_options;

using namespace prx::util;
using namespace std;

// int main(int ac, char* av[])
// {
    // global_reader = NULL;
    // ros::init(ac, av, "metric_test");
    // ros::NodeHandle main_node_handle;

    // double _x,_y;
    // std::vector<double*> state_memory = boost::assign::list_of(&_x)(&_y);
    // space_t* state_space = new space_t("XY", state_memory);
    // state_space->get_bounds()[0]->set_bounds(-100, 100);
    // state_space->get_bounds()[1]->set_bounds(-100, 100);

    // linear_distance_metric_t* linear = new linear_distance_metric_t();
    // ann_distance_metric_t* ann = new ann_distance_metric_t();
    // graph_distance_metric_t* graph = new graph_distance_metric_t();

    // linear->link_space(state_space);
    // ann->link_space(state_space);
    // graph->link_space(state_space);


    // std::vector<abstract_node_t*> nodes;
    // nodes.resize(50000);
    // cout<<"Populating metrics..."<<endl;
    // for(int i=0;i<50000;i++)
    // {
    //     nodes[i] = new abstract_node_t();
    //     nodes[i]->point = state_space->alloc_point();
    //     state_space->uniform_sample(nodes[i]->point);
    //     linear->add_point(nodes[i]);
    //     ann->add_point(nodes[i]);
    //     graph->add_point(nodes[i]);

    //     if(i%500 == 499)
    //         cout<<"--- "<<i<<endl;
    // }
    // space_point_t* query_point = state_space->alloc_point();
    // const abstract_node_t* linear_result;
    // const abstract_node_t* ann_result;
    // const abstract_node_t* graph_result;
    // unsigned ann_single_count = 0 ;
    // unsigned graph_single_count = 0;
    // unsigned linear_single_count = 5000;
    // cout<<"Testing single query..."<<endl;
    // for(int i=0;i<5000;i++)
    // {
    //     state_space->uniform_sample(query_point);
    //     linear_result = linear->single_query(query_point);
    //     ann_result = ann->single_query(query_point);
    //     graph_result = graph->single_query(query_point);
    //     if(linear_result != ann_result)
    //         ann_single_count++;
    //     if(linear_result != graph_result)
    //         graph_single_count++;
    //     if(i%500 == 499)
    //         cout<<"--- "<<i<<endl;
    // }



    // cout<<"Testing range query..."<<endl;
    // std::vector< const abstract_node_t* > linear_set;
    // std::vector< const abstract_node_t* > ann_set;
    // std::vector< const abstract_node_t* > graph_set;
    // unsigned ann_radius_count = 0 ;
    // unsigned graph_radius_count = 0;
    // unsigned linear_radius_count = 0;
    // for(int i=0;i<5000;i++)
    // {
    //     state_space->uniform_sample(query_point);
    //     linear_set = linear->radius_query(query_point,10);
    //     ann_set = ann->radius_query(query_point,10);
    //     graph_set = graph->radius_query(query_point,10);
    //     linear_radius_count+=linear_set.size();
    //     int ann_set_size = ann_set.size();
    //     int linear_set_size = linear_set.size();
    //     int graph_set_size = graph_set.size();

    //     int ann_size =PRX_MINIMUM(ann_set_size,linear_set_size);
    //     for(unsigned j=0;j<ann_size;j++)
    //     {
    //         double val = state_space->distance(query_point,linear_set[j]->point)-state_space->distance(query_point,ann_set[j]->point);
    //         if(val > PRX_ZERO_CHECK)
    //             cout<<"ANN FAILED"<<endl;
    //         if(linear_set[j]!=ann_set[j])
    //             ann_radius_count++;
    //     }
    //     ann_radius_count += abs(linear_set_size - ann_set_size);
    //     int graph_size =PRX_MINIMUM(linear_set.size(),graph_set.size());
    //     for(unsigned j=0;j<graph_size;j++)
    //     {
    //         double val = state_space->distance(query_point,linear_set[j]->point)-state_space->distance(query_point,graph_set[j]->point);
    //         if(val > PRX_ZERO_CHECK)
    //             cout<<"GRAPH FAILED: "<<state_space->distance(query_point,graph_set[j]->point)<<endl;
    //         if(linear_set[j]!=graph_set[j])
    //             graph_radius_count++;
    //     }
    //     graph_radius_count += abs(linear_set_size - graph_set_size);

    //     if(i%500 == 499)
    //         cout<<"--- "<<i<<endl;
    // }


    // cout<<"Testing k query..."<<endl;
    // unsigned ann_k_count = 0 ;
    // unsigned graph_k_count = 0;
    // unsigned linear_k_count = 0;
    // for(int i=0;i<5000;i++)
    // {
    //     state_space->uniform_sample(query_point);
    //     linear_set = linear->multi_query(query_point,100);
    //     ann_set = ann->multi_query(query_point,100);
    //     graph_set = graph->multi_query(query_point,100);
    //     linear_k_count+=linear_set.size();
    //     int ann_set_size = ann_set.size();
    //     int linear_set_size = linear_set.size();
    //     int graph_set_size = graph_set.size();
    //     cout<<linear_set_size<<" "<<ann_set_size<<" "<<graph_set_size<<endl;
    //     int ann_size =PRX_MINIMUM(ann_set_size,linear_set_size);
    //     for(unsigned j=0;j<ann_size;j++)
    //     {
    //         double val = state_space->distance(query_point,linear_set[j]->point)-state_space->distance(query_point,ann_set[j]->point);
    //         if(val > PRX_ZERO_CHECK)
    //             cout<<"ANN FAILED"<<endl;
    //         if(linear_set[j]!=ann_set[j])
    //             ann_k_count++;
    //     }
    //     ann_k_count += abs(linear_set_size - ann_set_size);
    //     int graph_size =PRX_MINIMUM(linear_set.size(),graph_set.size());
    //     for(unsigned j=0;j<graph_size;j++)
    //     {
    //         double val = state_space->distance(query_point,linear_set[j]->point)-state_space->distance(query_point,graph_set[j]->point);
    //         if(val > PRX_ZERO_CHECK)
    //             cout<<"GRAPH FAILED: "<<state_space->distance(query_point,graph_set[j]->point)<<endl;
    //         if(linear_set[j]!=graph_set[j])
    //             graph_k_count++;
    //     }
    //     graph_k_count += abs(linear_set_size - graph_set_size);

    //     if(i%500 == 499)
    //         cout<<"--- "<<i<<endl;
    // }





    // cout<<linear_single_count<<" "<<graph_single_count<<" "<<ann_single_count<<endl;
    // cout<<linear_radius_count<<" "<<graph_radius_count<<" "<<ann_radius_count<<endl;
    // cout<<linear_k_count<<" "<<graph_k_count<<" "<<ann_k_count<<endl;



    // return 0;
// }


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
       
    int random_seed;
    try
    {

        if(reader->has_attribute("random_seed"))
        {
            random_seed = reader->get_attribute_as<int>("random_seed");
            PRX_INFO_S ("Found a random seed in input: "<< random_seed);
            init_random(random_seed);
        }
        else
        {

//            std::srand(time(NULL));
            pid_t pid = getpid();
            unsigned int id = pid;
            random_seed = rand_r(&id);
            PRX_WARN_S ("No random seed found. Setting a truly random seed: " << random_seed);

            init_random(random_seed);
        }
    }
    catch(...)
    {
        PRX_ERROR_S ("Exception caught trying to read random seed for prx_simulation.");
    }

    if (reader->has_attribute("print_random_seed"))
    {

        if (reader->get_attribute_as<bool>("print_random_seed") == true)
        {
            std::ofstream fout;
            std::string filename = ros::this_node::getName() + "_random_seed.txt";
            PRX_PRINT ("Saving random seed: " << random_seed << " to file: " << filename, PRX_TEXT_CYAN);

            fout.open(filename.substr(1).c_str(), std::fstream::app);
            fout << random_seed << std::endl;
            fout.close();
        }
    }
    
    if( reader->has_attribute("application") )
    {
        application_t* app = reader->create_from_loader<application_t > ("application", "prx_simulation");
        app->init(reader);
        
        ros::param::del(init_name); 
        ros::Timer sim_timer = main_node_handle.createTimer(ros::Duration(simulation::simulation_step), &application_t::frame, app);
//        ros::Timer tf_timer = main_node_handle.createTimer(ros::Duration(simulation::simulation_step), &application_t::tf_broadcasting, app);
        ros::Timer comm_timer = main_node_handle.createTimer(ros::Duration(0.05), &application_t::info_broadcasting, app);
        ros::Timer geom_timer = main_node_handle.createTimer(ros::Duration(0.05), &application_t::geom_broadcasting, app);

        ros::getGlobalCallbackQueue()->callAvailable();

        // Run until the visualizer or ROS wants to stop.
        
        /** Multi threaded spinner might have a problem with tf broadcaster. Commented out for now.*/
        ros::MultiThreadedSpinner spinner(4);
        spinner.spin();
//        delete reader;
//        while( ros::ok() && app->running() )
//        {            
//            ros::getGlobalCallbackQueue()->callAvailable();
////            ros::getGlobalCallbackQueue()->callAvailable(ros::WallDuration(simulation::simulation_step));
////            ros::getGlobalCallbackQueue()->callAvailable(ros::WallDuration(0.1));
//        }
        
        

    }
    else
        PRX_FATAL_S("No Application has been initialized!");
    

    return 0;
}
