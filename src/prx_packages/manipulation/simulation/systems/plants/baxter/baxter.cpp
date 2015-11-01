/**
 * @file baxter.cpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Rahul Shome, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */
#include "simulation/systems/plants/baxter/baxter.hpp"

#include "prx/utilities/spaces/space.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"
#include "prx/simulation/simulators/simulator.hpp"
#include "prx/simulation/collision_checking/collision_checker.hpp"
#include "baxter_ikfast.w1.left.cpp"

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
#include <time.h>

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::baxter_t, prx::sim::system_t)

namespace prx
{
    using namespace sim;
    using namespace util;
    namespace packages
    {
        namespace manipulation
        {
            baxter_t::baxter_t()
            {
                input_path = pracsys_path + "/prx_packages/manipulation/input/baxter/";
            }

            void baxter_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                manipulator_t::init(reader, template_reader);
                // root_offset[2] += 1.57; //TODO: Find the correct offset of Baxter and place it here. 
            }

            void baxter_t::create_spaces()
            {
                state_space = new space_t("Baxter", state_memory);
                input_control_space = new space_t("Baxter", control_memory);
            }

	    void baxter_t::FK_generate_config_data(double data_100[][12]){
		double eerot[9], eetrans[3];
		double joints[7]; 
		double min[16] = {-1.70167993878, -2.147, -3.05417993878, -0.05, -3.059, -1.57079632679, -3.059, -1.70167993878, -2.147, 					-3.05417993878, -0.05, -3.059, -1.57079632679, -3.059, 1, 1};
  		double max[16] = {1.70167993878, 1.047, 3.05417993878, 2.618, 3.059, 2.094, 3.059, 1.70167993878, 1.047, 3.05417993878, 2.618, 					3.059, 2.094, 3.059, 2, 2};		
		// double min = -3.14; double max = 3.14;	
		// Generate random 100 configurations	
		// std::cout << "Start in loop" << std:: endl;
		for (int i = 0; i < 1000; ++i){	
		// Put random joint values into array
            	for (int k=0; k<7; ++k)
            	{
                double rnd = (double)rand() / (double)RAND_MAX;
                joints[k] = min[k] + rnd * (max[k] - min[k]);
            	}
		// Computer Forward Kinematics
		ComputeFk(joints, eetrans, eerot);
		// cout << i << " foward is generated." << std::endl;
		// Save the result eerot and eetrans into data_100
		for (int j = 0; j < 12; ++j){
			if (j< 9) data_100[i][j] = eerot[j];
			else data_100[i][j] = eetrans[j-9];		
		}
		}
	    }
            int baxter_t::IK_fast_solver( space_point_t* result_state, double data_100[][12])
            {
		// TODO: Call IK Fast. Note: You can change the definition if you need to pass extra information		
		IkReal vfree[20]; double eerot[9], eetrans[3], rnd; int count = 0, count_fix = 0;
		unsigned int num_of_solutions = 0;
		IkSolutionList<IkReal> solutions;
		timespec start_time, end_time;
        	unsigned int elapsed_time = 0;
        	unsigned int sum_time = 0;
		unsigned int calculate_sum_time = 0;
		int failure_count = 0;
		std::vector<double> single_solution;
		rnd = (double)rand() / (double)RAND_MAX;
                for (int i = 0; i < 20; ++i) {vfree[i] = -1.57079632679 + i * (2.094+1.57079632679)/20;}
		std::vector<double> vfree_vector; vfree_vector.push_back(vfree[0]);
		// computer Ik
		// loop for 100 ik fast	
		// output all IK-fast solutions
		std::cout << "------------------- IK-fast solutions for 1000 points -------------------" << std::endl;
		for (int i = 0; i< 1000; ++i){	
			eetrans[0] = data_100[i][9];eetrans[1] = data_100[i][10];eetrans[2] = data_100[i][11];
			for (int j = 0; j < 9; ++j){eerot[j] = data_100[i][j];}
			for (int k = 0; k < 20; ++k){
				clock_gettime(CLOCK_REALTIME, &start_time);
				bool bsuccess = ComputeIk(eetrans, eerot, &vfree[k], solutions);
				clock_gettime(CLOCK_REALTIME, &end_time);
				elapsed_time = (unsigned int)(end_time.tv_nsec - start_time.tv_nsec);
				sum_time += elapsed_time;
				
				if (bsuccess) {
					num_of_solutions += (int)solutions.GetNumSolutions();
					calculate_sum_time += elapsed_time;
					for (int l = 0; l < solutions.GetNumSolutions(); ++l){ 
						solutions.GetSolution(l).GetSolution(single_solution, vfree_vector);
						for (int j = 0; j< single_solution.size(); ++j){ std::cout<< single_solution[j] << " ";}
						std::cout << " | " << vfree[k] << std::endl;
					}
					count += 1;				
					break;
				}
				failure_count += 1;
			}
			// std::cout << "At configuration " << i << "IK fast compute or not? " << bsuccess << std::endl;
			// output solutions to check its data type
			// cout << "IK_fast results: " << solutions <<std::endl;
		        // You have to include the appropriate files generated by IK Fast to call the IK Fast functions.
		}
		for (int i = 0; i< 1000; ++i){
               		vfree[0] = -1.57079632679 + i * (2.094+1.57079632679)/1000;			
			eetrans[0] = data_100[0][9];eetrans[1] = data_100[0][10];eetrans[2] = data_100[0][11];
			for (int j = 0; j < 9; ++j){eerot[j] = data_100[0][j];}	
			bool bsuccess = ComputeIk(eetrans, eerot, &vfree[0], solutions);
			if (bsuccess) count_fix += (int)solutions.GetNumSolutions();
		}
		unsigned int average_time = sum_time/(count+failure_count);
		unsigned int average_calculate_time = calculate_sum_time/count;
		unsigned int average_no_solution_time = (sum_time - calculate_sum_time)/failure_count;
		std::cout << "-----------------------------  IK-fast  -----------------------------------------" << std::endl;
		std::cout << "1000 configuration IK-fast's # of success is: " << count << std::endl;
		std::cout << "IK-fast computes 1000 configuration's inverse kinematics take time : " << sum_time<<std::endl;	
		std::cout << "IK-fast successes " << count << " times, calculating # of solutions: "<< num_of_solutions <<std::endl;
		std::cout << "IK-fast average time: "<< average_time << std::endl;
		std::cout << "IK-fast solution calculation average time: "<< average_calculate_time << std::endl;
		std::cout << "IK-fast no solution found average time: "<< average_no_solution_time << std::endl;
		std::cout << "1000 random free joint value to find a fixed configuration by IK-fast, # of sulutions is: " << count_fix 			  << std::endl;
		return count;
            }
        }
    }
}





