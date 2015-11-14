/**
 * @file potential.hpp
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
#pragma once

#ifndef PRX_POTENTIAL_HPP
#define	PRX_POTENTIAL_HPP
#include "prx/utilities/definitions/defs.hpp"
#include "prx/planning/motion_planners/motion_planner.hpp"
#include "prx/simulation/plan.hpp"
#include "prx/simulation/trajectory.hpp"
#include "prx/simulation/collision_checking/collision_checker.hpp"
#include "prx/simulation/collision_checking/pqp_collision_checker.hpp"
#include "simulation/systems/plants/manipulator.hpp"


namespace prx
{
    namespace plan
    {

        class potential_t : public motion_planner_t
        {

          public:
            potential_t();
            virtual ~potential_t();

            /**
             * @copydoc motion_planner_t::init(const util::parameter_reader_t*,const util::parameter_reader_t*) 
             */
            virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader);

            /**
             * @copydoc motion_planner_t::reset() 
             */
            virtual void reset();

            /**
             * @copydoc motion_planner_t::link_specification(specification_t*) 
             */
            void link_specification(specification_t* new_spec);
            
            /** 
             * @copydoc motion_planner_t::setup() 
             * 
             * Will occupy memory for the random_point and the new_control, after 
             * planning_query has been linked. 
             */
            virtual void setup();

            /**
             * @copydoc motion_planner_t::execute() 
             * If the motion planner has a file to deserialize then it reads the graph from there instead of building a new graph. 
             *              
             * 
             * @return True if the execution was ok, otherwise false. 
             */
            virtual bool execute();

            /** 
             * @copydoc motion_planner_t::step() 
             * 
             * The algorithm will add one new node for every call of this function.
             */
            virtual void step();

            /** 
             * @copydoc motion_planner_t::resolve_query() 
             *
             * At the end of the resolve_query the algorithm will remove the vertices 
             * for the start and the goal for this specific query from the graph.
             */
            virtual void resolve_query();

            /**
             * @copydoc motion_planner_t::succeeded() const 
             */
            virtual bool succeeded() const;

            virtual const prx::util::statistics_t* get_statistics();


          protected:            
           
            /** @brief The length of the last generated solution. */
            double solution_length;
            sim::plan_t plan;
            sim::trajectory_t path;
            sim::pqp_collision_checker_t* collision_checker;
            prx::packages::manipulation::manipulator_t* manipulator;
            sim::plan_t output_plan;
            sim::plan_t temp_plan;
            sim::trajectory_t temp_trajectory;

            sim::state_t* start_state;
            sim::state_t* goal_state;
            sim::state_t* current_state;

            double time_step;
            /**
             * @copydoc planner_t::update_vis_info() const
             */
            virtual void update_vis_info() const;

            
            /**
             * @brief Checks if the trajectory on the edge is valid or not. 
             * 
             * Checks if the trajectory on the edge is valid or not. 
             * 
             * @param path The trajectory that has to be checked.
             */
            bool is_valid_trajectory(const sim::trajectory_t& path);
            
           


        };

    }
}

#endif
