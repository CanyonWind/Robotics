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
#include <tf/transform_datatypes.h>
#include </opt/ros/indigo/include/tf/LinearMath/Transform.h>

#include "simulation/systems/plants/baxter/baxter.hpp"
#include "utilities/mapping_functions/baxter_left_mappings.hpp"
#include "prx/utilities/definitions/defs.hpp"
#include <time.h>

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
	// output the topology of full space baxter & initial full state values
	std::vector<space_t::topology_t> topo = baxter_full_space->get_topology();
	for (int i = 0; i < 16; ++i){
	// std::cout << "topology " << i << "is :" << topo[i] <<std::endl;
	// std::cout << "full state value" << i << "is :" << full_point->memory[i] <<std::endl;
	}
    state_t* full_point_output = baxter_full_space->alloc_point();
    //A point in the left hand space of Baxter
    state_t* left_arm_point = baxter_left_arm_space->alloc_point();
    //A Configuration in SE3
    config_t end_effector_config;
	// output # of dimensions and the first state point values
	std::cout << "baxter left arm space # of dimensions: " << baxter_left_arm_space->get_dimension() << std::endl;
	std::cout << "baxter full space # of dimensions: " << baxter_full_space->get_dimension() << std::endl;
	
    // define desired position and quaternion(x, y, z, w)
  
	// tf::Quaternion q;
	// rotation_matrix.getRotation(q);
     
	
	// generate 100 configurations based on left arm mount
	double data_100[1000][12];
	std::cout << "Start generating FK." << std:: endl;
	baxter->FK_generate_config_data(data_100);
	std::cout << "Dataset is generated." << std::endl;
	std::cout << "------------------------------------------------------ 1000 random configurations ---------------------------------------------------" << std::endl;
	std::cout << "			 rotation matrix 00-22						|		transition xyz	" << std::endl;
	std::cout << "-------------------------------------------------------------------------------------------------------------------------------------" << std::endl;
	for (int i = 0; i < 1000; ++i){
	for (int j = 0; j < 12; ++j){
	if (j == 9) std::cout << "	|	";
	std::cout << data_100[i][j] << " ";
	}
	std::cout << std::endl;
	}
	// generate 100 configurations based on base
	double data_100_base[1000][12];

	tf::Matrix3x3 m;
	tf::Quaternion qi;
	std::vector<tf::Quaternion> q;
	for (int i=0; i<1000; i++)
	{
	    
	    /* for (int j=0; j<=3; j++)
	    {
		data_100_base[i][0] = data_100[i][0];
		data_100_base[i][1] = data_100[i][1];
		data_100_base[i][2] = data_100[i][2];
		
		data_100_base[i][3] = -data_100[i][6];
		data_100_base[i][4] = -data_100[i][7];
		data_100_base[i][5] = -data_100[i][8];
		
		data_100_base[i][6] = data_100[i][3];
		data_100_base[i][7] = data_100[i][4];
		data_100_base[i][8] = data_100[i][5];

	    }
	    data_100_base[i][9] = data_100[i][9] + 0.024645;
	    data_100_base[i][10] = -data_100[i][11] + 0.219645;
	    data_100_base[i][11] = data_100[i][10] + 0.118588;*/
	    for (int j=0; j<11; j++){
	    	data_100_base[i][j] = data_100[i][j];
	    }
	    data_100_base[i][11] = data_100[i][11]-1;
	    
	    
	    //transfer to quaternion
	    m.setValue(data_100_base[i][0],data_100_base[i][1],data_100_base[i][2],
		       data_100_base[i][3],data_100_base[i][4],data_100_base[i][5],
		       data_100_base[i][6],data_100_base[i][7],data_100_base[i][8]);
	    m.setRotation(qi);
	    q.push_back(qi);
	}

    // double position[3];
    // double quaternion[4];

    
    int count = 0;
	timespec start_time, end_time;
        unsigned int elapsed_time = 0;
        unsigned long sum_time = 0;
	unsigned long calculate_sum_time = 0;
	// double mydoubles[16] = {0.1, 0.2, 0.3, 0.4, 0.2, 0.4, 0.8, 0.6, 0.1, 0.2, 0.3, 0.4,0.5, 0.2, 1, 1};
	double min[16] = {-1.70167993878, -2.147, -3.05417993878, -0.05, -3.059, -1.57079632679, -3.059, -1.70167993878, -2.147, -3.05417993878, 				-0.05, -3.059, -1.57079632679, -3.059, 1, 1};
  	double max[16] = {1.70167993878, 1.047, 3.05417993878, 2.618, 3.059, 2.094, 3.059, 1.70167993878, 1.047, 3.05417993878, 2.618, 3.059, 				2.094, 3.059, 2, 2};
	double joints[1000][16]; config_t config_random[1000];	
	// Generate random 100 configurations	
	// std::cout << "Start in loop" << std:: endl;
	for (int i = 0; i < 1000; ++i){	
		// Put random joint values into array
      		for (int j=0; j<16; ++j){
		if (j < 14){
       			double rnd = (double)rand() / (double)RAND_MAX;
                	joints[i][j] = min[j] + rnd * (max[j] - min[j]);
			// joints[i][j] = -3.14 + rnd * (3.14*2);
		}
		else
			joints[i][j] = 1;
        	}
		std::vector<double> space_value (joints[i], joints[i] + sizeof(joints[i]) / sizeof(double) );
		baxter_full_space->set_from_vector(space_value, full_point);
		// copy new full_point into the space
		baxter_full_space->copy_from_point(full_point);	
		// compute forward kinematics
		baxter->FK_solver( config_random[i], "end_effector_left");
	}
 
	// std::vector<double> space_value (mydoubles, mydoubles + sizeof(mydoubles) / sizeof(double) );
	//std::vector<double> space_value = {0.2, 0.2, 0.2, 0.2,0.2, 0.2, 0.2, 0.2,0.2, 0.2, 0.2, 0.2,0.2, 0.2, 0.2, 0.2};
	// baxter_full_space->set_from_vector(space_value, full_point);
	// copy new full_point into the space
	// baxter_full_space->copy_from_point(full_point);
	// baxter->FK_solver( end_effector_config, "end_effector_left");
	// baxter->get_state_space()->free_point(full_point);

    // -------- loop for KDL 1000 configuration points ----------------//
    std:: cout << "----------------------------- KDL for 1000 random configurations --------------------------" << std::endl;
    for (int i = 0; i< 1000; ++i){
    // end_effector_config.set_position(data_100_base[i][9], data_100_base[i][10],  data_100_base[i][11]);
    // end_effector_config.set_orientation(q[i].x(), q[i].y(), q[i].z(), q[i].w());
    // KDL IK can be called using baxter->IK_solver
	// Measure avg time for IK
        clock_gettime(CLOCK_REALTIME, &start_time);
	bool success = baxter->IK_solver( full_point_output, full_point, config_random[i], "base", "end_effector_left" );
	if (success) {
	for (int j = 0; j< 7; ++j){std::cout << full_point_output->memory[j] << " ";}
	std::cout << std::endl;	
	}
	clock_gettime(CLOCK_REALTIME, &end_time);
	elapsed_time = (unsigned int)(end_time.tv_nsec - start_time.tv_nsec);
        sum_time += elapsed_time;
	if(success) count += 1;
	if(success) calculate_sum_time += elapsed_time;
	// std::cout << "At configuration " << i << " KDL success or not?" << success << std::endl;
    }
    // KDL results information
    unsigned long average_time = sum_time/1000;
    unsigned long average_calculate_time = calculate_sum_time/count;
    unsigned long average_no_solution_time = (sum_time-calculate_sum_time)/(1000-count);
    std::cout << "-------------------------------  KDL  ----------------------------------------" << std::endl;
    std::cout << "1000 configuration KDL's # of success is: " << count << std::endl;
    std::cout << "KDL computing 1000 configuration's inverse kinematics take time : " << sum_time<<std::endl;
    std::cout << "KDL successes " << count << " times, calculating solutions total time: "<< calculate_sum_time <<std::endl;
    std::cout << "KDL average time: " << average_time << std::endl;
    std::cout << "KDL solution calculation average time: "<< average_calculate_time << std::endl;
    std::cout << "KDL no solution found average time: "<< average_no_solution_time << std::endl;
    // --------- KDL to find a specific configuration with 1000 different seeds(space_point_t) --------------//
    std::vector<std::vector<double> > joints_results;
    std::vector<double> joints_single;
    for (int i = 0; i<1000; ++i){
	std::vector<double> space_value (joints[i], joints[i] + sizeof(joints[i]) / sizeof(double) );
	baxter_full_space->set_from_vector(space_value, full_point);
    bool success = baxter->IK_solver( full_point_output, full_point, config_random[27], "base", "end_effector_left" );
    if(success) {
	for(int j=0; j<16; ++j){ joints_single.push_back(full_point_output->memory[j]);}
	joints_results.push_back(joints_single);
    }
    }
    // find the unique results
	std::vector<double> temp_vector;
	for ( int i = 0; i < joints_results.size(); ++i){
		temp_vector = joints_results[i];
		for( int j = i+1; j < joints_results.size(); ++j){
		if(joints_results[j] == temp_vector){joints_results.erase (joints_results.begin()+j);}		
		}
	}
    // output the unqiue solution number
    std::cout<< "1000 seeds to find a fixed configuration by KDL, # of sulutions is: " << joints_results.size() << std::endl;

    // ---------- loop for ik fast 1000 configuration points -------------//
    // Implement IK Fast in the baxter plant and call it using
    count = baxter->IK_fast_solver( left_arm_point, data_100 );
    // Get the desired statistics 
    // std::cout << "100 configuration ik_fast's # of solutions is: " << count << std::endl;
    
    

    PRX_DEBUG_COLOR("Statistics! ",PRX_TEXT_MAGENTA);


    return 0;
}
