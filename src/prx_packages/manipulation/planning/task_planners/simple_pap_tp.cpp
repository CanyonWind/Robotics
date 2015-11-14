/**
 * @file simple_pap_tp.cpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2013, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "planning/task_planners/simple_pap_tp.hpp"

#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/definitions/random.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/statistics/statistics.hpp"

#include <boost/range/adaptor/map.hpp>
#include <pluginlib/class_list_macros.h>


#include "prx/planning/communication/planning_comm.hpp"

PLUGINLIB_EXPORT_CLASS(prx::packages::manipulation::simple_pap_tp_t ,prx::plan::planner_t)

namespace prx
{
    using namespace util;
    using namespace sim;
    using namespace plan;

    namespace packages
    {
        namespace manipulation
        {

            simple_pap_tp_t::simple_pap_tp_t()
            {

            }

            simple_pap_tp_t::~simple_pap_tp_t()
            {

            }

            void simple_pap_tp_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
            {
                PRX_INFO_S("Initializing simple_pap_tp_t task planner ...");
                task_planner_t::init(reader,template_reader);
                full_manipulator_context_name = parameters::get_attribute("full_manipulator_context_name", reader, template_reader);
                manipulation_context_name = parameters::get_attribute("manipulation_context_name", reader, template_reader);
                object_target_vec = parameters::get_attribute_as<std::vector<double> >("object_target", reader, template_reader);
                manipulation_task_planner_name = parameters::get_attribute("manipulation_task_planner_name", reader, template_reader);
                ready_to_plan_publisher = node.advertise< std_msgs::String > ("/ready_to_plan", 1, true);
                manipulation_request_subscriber = node.subscribe( "/manipulation_request", 1, &simple_pap_tp_t::manipulation_request_callback, this);
                waiting_for_manipulation_plan_end = true;
                number_of_manipulations = -1;
            }

            void simple_pap_tp_t::link_world_model(world_model_t * const model)
            {
                task_planner_t::link_world_model(model);
                manipulation_model = dynamic_cast<manipulation_world_model_t*>(model);
                if(manipulation_model == NULL)
                    PRX_FATAL_S("The manipulation task planner can work only with manipulation world model!");
            }

            void simple_pap_tp_t::link_query(query_t* new_query)
            {
                task_planner_t::link_query(new_query);
                in_query = static_cast<motion_planning_query_t*>(new_query);
            }

            void simple_pap_tp_t::setup()
            {
                manipulation_model->use_context(full_manipulator_context_name);
                manip_initial_state = manipulation_model->get_state_space()->alloc_point();

                foreach(planner_t* planner, planners | boost::adaptors::map_values)
                {
                    PRX_INFO_S("setup planner: " << planner->get_name());
                    planner->setup();
                }
            }

            bool simple_pap_tp_t::execute()
            {
                foreach(planner_t* planner, planners | boost::adaptors::map_values)
                {                    
                    PRX_INFO_S("execute planner: " << planner->get_name());
                    planner->execute();
                }
                return true;
            }

            bool simple_pap_tp_t::succeeded() const
            {
                return true;
            }

            const util::statistics_t* simple_pap_tp_t::get_statistics()
            {
                return NULL;
            }

            void simple_pap_tp_t::resolve_query()
            {
                if(number_of_manipulations == -1)
                {
                    std_msgs::String msg;
                    std::stringstream ss;
                    ss<<"ready";
                    msg.data = ss.str();
                    if( ready_to_plan_publisher.getNumSubscribers() == 0 )
                    {
                        PRX_ERROR_S("No subscribers! Commence Sleeping");
                        double sleep_duration = 0;
                        while( ready_to_plan_publisher.getNumSubscribers() == 0 )
                        {
                            sleep_duration += 0.1;
                            sleep(0.1);

                        }
                        PRX_WARN_S("*Slept for: " << sleep_duration);
                    }
                    ready_to_plan_publisher.publish(msg);
                    number_of_manipulations++;
                }
                while( waiting_for_manipulation_plan_end && ros::ok())
                {
                    ros::spinOnce();
                }
                
            }

            void simple_pap_tp_t::manipulation_request_callback(const std_msgs::String::ConstPtr& msg)
            {

                config_t retract_config;
                retract_config.set_position(0,0,-.05);
                retract_config.set_orientation(0,0,0,1);
                PRX_DEBUG_COLOR("Resolve query from simple_pap_tp ...  context:" << manipulation_context_name,PRX_TEXT_GREEN);
                manipulation_model->use_context(full_manipulator_context_name);           

                std::vector<double> state_vec = ((plan::comm::planning_comm_t*)plan::comm::plan_comm)->request_ground_truth();//Gets the state of the simulator. Once you change the position of objects in the simulator this will get the updated state.

                state_t* full_state = manipulation_model->get_full_state_space()->alloc_point();
                PRX_DEBUG_COLOR("Full state in Planning::: "<<manipulation_model->get_full_state_space()->print_point(full_state, 4), PRX_TEXT_RED);
                manipulation_model->get_full_state_space()->copy_vector_to_point(state_vec, full_state);
                manipulation_model->get_full_state_space()->copy_from_point(full_state);
                PRX_DEBUG_COLOR("Full state in Simulate::: "<<manipulation_model->get_full_state_space()->print_point(full_state, 4), PRX_TEXT_RED);  

                


                manipulation_model->use_context(manipulation_context_name);
                std::vector<movable_body_plant_t* > objects;
                manipulation_model->get_objects(objects);
                int OBJECT_INDEX = objects.size()-1;//This would be ideally coming from the DECISION MAKER of your implementation, ie. the logic that tells you what object to pick.
                const space_t* object_space = objects[OBJECT_INDEX]->get_state_space();

                manipulator = manipulation_model->get_current_manipulation_info()->manipulator; //The pointer to the manipulator (Baxter)  
                in_query->link_spaces(manipulator->get_state_space(), manipulator->get_control_space());   //The data structure that aggregates the result, from possibly multiple manipulation queries         
                state_t* initial_state = manipulation_model->get_state_space()->alloc_point(); // Initial state of the robot
                state_t* target_state = manipulation_model->get_state_space()->alloc_point(); //Target state of the robot(here the same as the initial state)

                state_t* initial_object = object_space->alloc_point(); // The point that that stores the initial unchanged state of the object
                state_t* target_object = object_space->alloc_point(); 
                object_space->copy_vector_to_point(object_target_vec, target_object); // The point that that stores the target state of the object, coming from input
                PRX_DEBUG_COLOR("Initial state of object::: "<<object_space->print_point(initial_object, 4), PRX_TEXT_GREEN);  
                


                // AI_PRX_TODO
                // A single manipulation query is constructed. Check the manipulation_query_tp for information about the parameters, chief among which would be initial_object and target_object which specify the initial and target states. Note that initial_state, target_state implies that the manipulator ends up where is started
                
                // PRX_FATAL_S("Construct the correct Manipulation Query");
                /* Replace the following declaration with correct variable names/values */
                manipulation_query = 
                new manipulation_query_t(
                    manipulation_context_name, 
                    manipulation_query_t::PRX_PICK_AND_PLACE, 
                    objects[OBJECT_INDEX], 
                    -1, 
                    1, 
                    retract_config, 
                    initial_state, 
                    target_state, 
                    NULL, 
                    initial_object, 
                    target_object 
                    ); 

		manipulation_query->plan.clear();


                planners[manipulation_task_planner_name]->link_query(manipulation_query); //The query has to be linked to the task planner. Changing the query and linking again will make it execute initialize the task planner with the new query

		std::clock_t begin = clock();
                planners[manipulation_task_planner_name]->resolve_query(); //The resolve query makes the task planner actually solve the problem and populate the manipulation_query->plan with a viable plan to solve the problem. If the size of the plan is 0 then a solution could not be found.
		std::clock_t end = clock();
		double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

                manipulation_model->convert_plan(in_query->plan, manipulator->get_control_space(), manipulation_query->plan, manipulation_model->get_control_space()); //This converts the plan returned in the manipulation query to the plan that the in_query aggregates and appends it to the end of in_query->plan. Calling this function multiple times with different plans will grow the in_query->plan
                
                if(manipulation_query->plan.size()>0)
                {
                    object_space->copy_from_point(target_object);
			success_or_not.push_back(true);
                }
		else {success_or_not.push_back(false);}

                elapsed_times.push_back(elapsed_secs);
		 PRX_DEBUG_COLOR("================================ Elapsed Time =============================", PRX_TEXT_GREEN);
		double time_failure, time_success, time_success_average, time_failure_average; 
		int success_count, sum_count;
		for (int i = 0; i< elapsed_times.size(); ++i){ 
			std::cout << "success or not: "<< success_or_not[i] << "; elapsed time: " << elapsed_times[i] << std::endl; 
			sum_count += 1;			
			if (success_or_not[i]){
				time_success += elapsed_times[i];
				success_count += 1; 
			}
			else {
				time_failure += elapsed_times[i];			
			}
		}
		std::cout << "success time: " << time_success << "; failure time: " << time_failure << "; success rate: " << success_count/sum_count << std::endl;
                manipulation_model->use_context(full_manipulator_context_name);
                waiting_for_manipulation_plan_end = false;//mutex to keep resolve_query() waiting
                number_of_manipulations++;//The number of manipulations till now
            }
        }
    }
}


