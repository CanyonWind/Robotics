/**
 * @file grasping_planner.hpp
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

#ifndef PRX_GRASPING_PLANNER_HPP
#define	PRX_GRASPING_PLANNER_HPP

#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/parameters/parameter_reader.hpp"
#include "prx/utilities/definitions/sys_clock.hpp"
#include "prx/utilities/boost/hash.hpp"
#include "prx/utilities/math/configurations/config.hpp"
#include "prx/utilities/spaces/space.hpp"

#include "prx/simulation/plan.hpp"
#include "prx/simulation/trajectory.hpp"

#include "prx/planning/planner.hpp"
#include "prx/planning/problem_specifications/specification.hpp"
#include "prx/planning/queries/query.hpp"

#include "planning/manipulation_world_model.hpp"
#include "planning/queries/grasping_query.hpp"

namespace prx
{
    namespace packages
    {
        namespace manipulation
        {
            class manipulation_world_model_t;
            class grasping_query_t;

            /**
             * Manipulation task planner. Computes the path for moving an object from an
             * initial to a target position.
             *
             * @autors Athanasios Krontiris
             */
            class grasping_planner_t : public plan::planner_t
            {

              public:

                grasping_planner_t();
                virtual ~grasping_planner_t();

                virtual void init(const util::parameter_reader_t* reader, const util::parameter_reader_t* template_reader);

                /**
                 * @copydoc planner_t::reset()
                 */
                virtual void reset();

                /**
                 * @copydoc planner_t::link_world_model()
                 */
                virtual void link_world_model(plan::world_model_t * const model);

                /**
                 * @copydoc planner_t::get_statistics()
                 */
                virtual const util::statistics_t* get_statistics();

                /**
                 * @copydoc planner_t::link_specification(specification_t*)
                 */
                virtual void link_specification(plan::specification_t* new_spec);

                /**
                 * @copydoc planner_t::link_query()
                 */
                virtual void link_query(plan::query_t* new_query);

                /**
                 * @copydoc planner_t::setup()
                 */
                virtual void setup();

                /**
                 * @copydoc planner_t::execute()
                 */
                virtual bool execute();


                /**
                 * @copydoc planner_t::succeeded() const
                 */
                virtual bool succeeded() const;

                /**
                 * @copydoc planner_t::resolve_query()
                 *
                 * At the end of the resolve_query the algorithm will remove the vertices
                 * for the start and the goal for this specific query from the graph.
                 */
                virtual void resolve_query();

                /** @copydoc planner_t::set_param(const std::string& , const std::string& , const boost::any& ) */
                virtual void set_param(const std::string& path, const std::string& parameter_name, const boost::any& value);

                bool serialize();
                bool deserialize();

              protected:

                /** @copydoc planner_t::set_param(const std::string&, const boost::any&) */
                virtual void set_param(const std::string& parameter_name, const boost::any& value);

                /** @brief Pointer to the current problem specification */
                plan::specification_t* input_specification;

                manipulation_world_model_t* manipulation_model;

                grasping_query_t* grasping_query;

                /** @brief A map for the different types */
                util::hash_t<std::string, std::vector<util::config_t> > grasps;




            };
        }
    }
}


#endif
