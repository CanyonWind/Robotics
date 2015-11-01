/**
 * @file manipulation_tp_t.hpp
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

#ifndef PRX_MANIPULATION_TP_HPP
#define	PRX_MANIPULATION_TP_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/sys_clock.hpp"
#include "prx/utilities/boost/hash.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/spaces/space.hpp"

#include "prx/simulation/plan.hpp"
#include "prx/simulation/trajectory.hpp"

#include "prx/planning/task_planners/task_planner.hpp"
#include "prx/planning/motion_planners/motion_planner.hpp"
#include "prx/planning/queries/query.hpp"
#include "prx/planning/queries/motion_planning_query.hpp"

#include "planning/manipulation_world_model.hpp"
#include "planning/queries/manipulation_query.hpp"
#include "planning/queries/grasping_query.hpp"


namespace prx
{
    namespace packages
    {
        namespace manipulation
        {
            class planner_context_info_t
            {
              public:
                std::string planning_context_name;
                std::string planner_name;
                plan::motion_planner_t* planner;
                plan::motion_planning_query_t* query;
                const util::space_t* state_space;
                const util::space_t* control_space;

                planner_context_info_t(std::string planning_context_name, plan::planner_t* planner, plan::query_t* query)
                {
                    this->planning_context_name = planning_context_name;
                    this->planner = dynamic_cast<plan::motion_planner_t*>(planner);
                    planner_name = planner->get_name();
                    if(this->planner == NULL)
                        PRX_FATAL_S("Manipulation task planner can only work with motion planners!");
                    this->query = dynamic_cast<plan::motion_planning_query_t*>(query);
                    if(this->query == NULL)
                        PRX_FATAL_S("Manipulation task planner van have only motion planning queries as output queries.");
                }

                void link_spaces(const util::space_t* state_space, const util::space_t* control_space)
                {
                    this->state_space = state_space;
                    this->control_space = control_space;
                    query->link_spaces(state_space, control_space);
                }

                bool compute_solution(sim::state_t* start_state, sim::state_t* goal_state)
                {
                    query->setup(start_state, goal_state);
                    planner->link_query(query);
                    planner->resolve_query();
                    return query->found_solution;
                }
            };

            /**
             * Manipulation task planner. Computes the path for moving an object from an
             * initial to a target position.
             *
             * @authors Athanasios Krontiris
             */
            class manipulation_tp_t : public plan::task_planner_t
            {

              public:

                manipulation_tp_t();
                virtual ~manipulation_tp_t();

                virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader);

                /**
                 * @copydoc motion_planner_t::reset()
                 */
                virtual void reset();

                /**
                 * @copydoc motion_planner_t::link_world_model()
                 */
                virtual void link_world_model(plan::world_model_t * const model);

                /**
                 * @copydoc motion_planner_t::get_statistics()
                 */
                virtual const util::statistics_t* get_statistics();

                /**
                 * @copydoc planner_t::link_specification(specification_t*)
                 */
                virtual void link_specification(plan::specification_t* new_spec);

                /**
                 * @copydoc motion_planner_t::link_query()
                 */
                virtual void link_query(plan::query_t* new_query);

                /**
                 * @copydoc motion_planner_t::setup()
                 *
                 * Will occupy memory for the random_open_point and the new_control, after
                 * planning_query has been linked.
                 */
                virtual void setup();

                /**
                 * @copydoc motion_planner_t::execute()
                 */
                virtual bool execute();


                /**
                 * @copydoc motion_planner_t::succeeded() const
                 */
                virtual bool succeeded() const;

                /**
                 * @copydoc motion_planner_t::resolve_query()
                 *
                 * At the end of the resolve_query the algorithm will remove the vertices
                 * for the start and the goal for this specific query from the graph.
                 */
                virtual void resolve_query();

                bool serialize();
                bool deserialize();

              protected:

                manipulation_world_model_t* manipulation_model;

                /** @brief A map from planning context to manipulation contexts (planner, query and spaces)*/
                util::hash_t<std::string, planner_context_info_t*> context_maps;
                /** @brief The current active context (planner, query and spaces)*/
                planner_context_info_t* active_planner;

                /** @brief The input manipulation query */
                manipulation_query_t* manipulation_query;

                /** @brief The grasping planner.*/
                planner_t* grasping_planner;
                /** @brief The grasping query that the manipulation task planner will use to communicate with the grasping planner.*/
                grasping_query_t* grasping_query;

                /**
                 * @brief If we want to serialize all the roadmaps after we finish building them. 
                 * If want to serialize the roadmaps the motion planners have to read the output file
                 * from their input. Otherwise the serialization will failed.
                 */
                bool serialize_flag;

                virtual bool pick(sim::plan_t& plan, sim::state_t* manipulator_final_state, sim::state_t* manipulator_initial_state, sim::state_t* object_initial_state, int grasping_id);
                virtual bool place(sim::plan_t& plan, sim::state_t* manipulator_final_state, sim::state_t* manipulator_initial_state, sim::state_t* object_target_state, int grasping_id);
                virtual bool move(sim::plan_t& plan, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state);
                virtual bool pick_and_place(sim::plan_t& plan, sim::state_t* manipulator_initial_state, sim::state_t* manipulator_target_state, sim::state_t* object_initial_state, sim::state_t* object_target_state, int grasping_id);


                /**
                 * @copydoc planner_t::update_vis_info() const
                 */
                virtual void update_vis_info() const;
            };
        }
    }
}


#endif
