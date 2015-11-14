/**
 * @file prm.cpp
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

#include "prx/planning/motion_planners/potential/potential.hpp"

#include "prx/utilities/definitions/sys_clock.hpp"
#include "prx/utilities/definitions/string_manip.hpp"
#include "prx/utilities/goals/goal.hpp"
#include "prx/utilities/distance_metrics/distance_metric.hpp"
#include "prx/planning/modules/samplers/sampler.hpp"
#include "prx/planning/modules/validity_checkers/validity_checker.hpp"
#include "prx/planning/modules/local_planners/local_planner.hpp"
#include "prx/planning/modules/stopping_criteria/stopping_criteria.hpp"
#include "prx/planning/queries/motion_planning_query.hpp"
#include "prx/planning/problem_specifications/motion_planning_specification.hpp"
#include "prx/planning/communication/visualization_comm.hpp"
#include "prx/simulation/collision_checking/collision_list.hpp"
#include "prx/utilities/statistics/statistics.hpp"
#include "prx/utilities/definitions/sys_clock.hpp"

#include <pluginlib/class_list_macros.h>
#include <boost/assign/list_of.hpp>
#include <boost/graph/subgraph.hpp>
#include <boost/range/adaptor/map.hpp>
#include <boost/graph/connected_components.hpp>


PLUGINLIB_EXPORT_CLASS(prx::plan::potential_t, prx::plan::planner_t)

namespace prx
{
    using namespace util;
    using namespace sim;

    namespace plan
    {

        potential_t::potential_t()
        {
        }

        potential_t::~potential_t()
        {
        }

        void potential_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
        {
            motion_planner_t::init(reader, template_reader);
            statistics = new statistics_t();
            time_step = simulation::simulation_step;

        }

        void potential_t::reset()
        {
        }

        void potential_t::link_specification(specification_t* new_spec)
        {
            motion_planner_t::link_specification(new_spec);

            //collision_checker gives access to closest point queries
            if (dynamic_cast<pqp_collision_checker_t*>(validity_checker->get_collision_checker()) != NULL)
                collision_checker = dynamic_cast<pqp_collision_checker_t*>(validity_checker->get_collision_checker()) ;
            else
                PRX_FATAL_S("Needs PQP Collision Checker");


            collision_list_t* collision_list = validity_checker->get_collision_checker()->get_collision_list();

            //These pairs are the bodies that are considered for collision checking
            //These names have to be used to ask the collision checker for additional information
            foreach(collision_pair_t pair, collision_list->get_body_pairs())
            {
                PRX_DEBUG_COLOR("Collision pairs:: ( "<< pair.first <<", "<< pair.second<<" )", PRX_TEXT_BROWN);
            }

            //The manipulator in the environment loaded from the baxter
            manipulator = dynamic_cast< prx::packages::manipulation::manipulator_t* >(validity_checker->get_world_model()->get_simulator()->get_system("simulator/baxter").get());
            //The path to the baxter will depend upon the system tree. This might be different in another setup. Either the path has to be taken as input or this should be set to where the manipulator can be found.
            if(manipulator !=NULL)
                PRX_INFO_S("Manipulator Loaded");
            else
                PRX_FATAL_S("Manipulator not loaded!");


        }

        void potential_t::setup()
        {
            temp_plan.link_control_space(control_space);
            temp_plan.link_state_space(state_space);
            temp_trajectory.link_space(state_space);

            start_state = state_space->alloc_point();
            current_state = state_space->alloc_point();
        }

        bool potential_t::execute()
        {
            throw stopping_criteria_t::stopping_criteria_satisfied(" Stopping criteria is satisfied ");
        }

        void potential_t::step()
        {
            //TODO
            std::vector<double> pt1, pt2; //The two points which would be populated by the closest points on the two bodies
            //Call the collision checker with the two points and the valid names of the two bodies
            //Dist stores the distance between the points
            //The two points are updated with the coordinates in the local coordinate frame of the collision volumes, that correspond to the closest points between the two
            //dist stores the distance between the two volumes
            //Call the function with a link from the robot and the obstacle to get the distance of the link from the obstacle. This gives the magnitude of the vector
            //Transform the local point into the global frame to get two points in the global frame. This gives the direction of the vector
            //Conversely you can find out the approximate direction by subtracting the center of the link(call manipulator->FK) and the center of the obstacle
            double dist = collision_checker->closest_points(pt1, pt2, "simulator/baxter/left_lower_elbow", "simulator/obstacles/ball/ball");
            PRX_DEBUG_COLOR("\n-----------------------", PRX_TEXT_GREEN);
            PRX_DEBUG_COLOR("PT 1 : "<<pt1[0]<<", "<<pt1[1]<<", "<<pt1[2], PRX_TEXT_BLUE);
            PRX_DEBUG_COLOR("PT 2 : "<<pt2[0]<<", "<<pt2[1]<<", "<<pt2[2], PRX_TEXT_BLUE);
            PRX_DEBUG_COLOR("Distance : "<<dist, PRX_TEXT_RED);
            PRX_DEBUG_COLOR("-----------------------\n", PRX_TEXT_GREEN);

            //Calculate the necessary forces
            /*

                >>Given the latest state of the motion planner, calculate the forces applied to the robot at this state. This includes computing both 
                the point on the robot where these forces are applied, their magnitude and direction.    
                >>Compute the control that arise due to these forces. This involves the computation of a Jacobian matrix that 
                depends on the point that these forces are applied.
                >>Propagate the state of the motion planner given the computed control. This involves calling functionality from the world model.
                >>Append the control to the output plan and the state to the output path.

                
                //NOTE: The controls are angular velocities on the joints.
                //****Once you have the control c, for time_step(=simulation::simulation_step) 
                //Create a plan with only that control
                temp_plan.clear();
                temp_plan.copy_onto_back(c,time_step);

                //If you have a plan and want to apply the control sequence to a state, the propagate returns the trajectory this would generate
                local_planner->propagate(current_state, temp_plan, temp_trajectory);


                //The generated plan and path can be checked if valid
                if( temp_plan.size() != 0 && validity_checker->is_valid(temp_trajectory) )
                {   
                    //Plan is valid and trajectory is collision free
                    //The last state in the trajectory gives the state the robot will reach if acted on by the controls in the temp_plan.
                    //Update the state space or the current_state with this.
                    //Append temp_plan to output_plan
                }
                
               
            */




        }

        bool potential_t::succeeded() const
        {
            PRX_INFO_S("potential_t");
            if( input_specification->get_stopping_criterion()->satisfied() )
                return true;
            return false;
        }

        void potential_t::resolve_query()
        {
            PRX_ASSERT(input_specification != NULL);
            unsigned goals_size;
            sys_clock_t clck;
            std::vector<space_point_t*> goals = input_query->get_goal()->get_goal_points(goals_size);
            if(goals.size()>0)
            {
                goal_state = goals[0];
                PRX_INFO_S("Goals have been linked. Taking the first one : "<<state_space->print_point(goal_state, 4));

            }
            else
            {
                PRX_WARN_S("No Goals linked.");
            }



            try
            {
                do
                {
                    step();
                }
                while( !input_specification->get_stopping_criterion()->satisfied() );
                //You need to decide when it actually stops planning. Check the different stopping criteria to stop this once the goal is reached.
            }
            catch( stopping_criteria_t::stopping_criteria_satisfied e )
            {
                double timeout = clck.measure();
                PRX_INFO_S(e.what()<<" at time: "<<timeout);
                input_query->plan = output_plan;
            }
            

        }

        void potential_t::update_vis_info() const
        {

        }

        

        bool potential_t::is_valid_trajectory(const sim::trajectory_t& path)
        {
            return validity_checker->is_valid(path);
        }

        const statistics_t* potential_t::get_statistics()
        {
            statistics->time = 0;
            statistics->steps = 0;
            return statistics;
        }


    }
}
