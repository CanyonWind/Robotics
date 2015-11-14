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

#include "prx/planning/motion_planners/prm_star/prm_star.hpp"
#include "prx/planning/motion_planners/prm_star/prm_star_statistics.hpp"

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
#include "prx/planning/modules/heuristic_search/astar_module.hpp"
#include "prx/planning/communication/visualization_comm.hpp"

#include <pluginlib/class_list_macros.h>
#include <boost/assign/list_of.hpp>
#include <boost/graph/subgraph.hpp>
#include <boost/range/adaptor/map.hpp>
#include <boost/graph/connected_components.hpp>
//#include <boost/filesystem/v3/operations.hpp>
#include <boost/graph/compressed_sparse_row_graph.hpp>


PLUGINLIB_EXPORT_CLASS(prx::plan::prm_star_t, prx::plan::planner_t)

namespace prx
{
    using namespace util;
    using namespace sim;

    namespace plan
    {

        prm_star_t::prm_star_t()
        {
            random_point = NULL;
            update_k(0);
            statistics = new prm_star_statistics_t();
            num_edges = 0;
            num_vertices = 0;
            num_generated = 0;
            last_solution_length = PRX_INFINITY;
            pno_mode = false;
            no_collision_query_type = false;
            near_query_type = false;
            astar = NULL;
        }

        prm_star_t::~prm_star_t()
        {
            state_space->free_point(random_point);
            new_plan.clear();
            new_plan2.clear();
            if( astar != NULL )
            {
                delete astar;
                astar = NULL;
            }
        }

        void prm_star_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
        {
            PRX_INFO_S("Initializing PRM motion planner... ");
            motion_planner_t::init(reader, template_reader);

            if( parameters::has_attribute("heuristic_search", reader, template_reader) )
            {
                astar = parameters::initialize_from_loader<astar_module_t > ("prx_planning", reader, "heuristic_search", template_reader, "heuristic_search");
            }
            else
            {
                PRX_WARN_S("Missing A*, heuristic search algorithm, during initialization of PRM!");
            }


            visualize_graph = parameters::get_attribute_as<bool>("visualize_graph", reader, template_reader, true);
            visualize_solutions = parameters::get_attribute_as<bool>("visualize_solutions", reader, template_reader, true);
            visualization_graph_name = parameters::get_attribute_as<std::string > ("visualization_graph_name", reader, template_reader, "prm/graph");
            visualization_solutions_name = parameters::get_attribute_as<std::string > ("visualization_solutions_name", reader, template_reader, "prm/solutions");
            graph_color = parameters::get_attribute_as<std::string > ("graph_color", reader, template_reader, "black");
            delta_prm = parameters::get_attribute_as<bool>("delta_prm", reader, template_reader, false);
            pno_mode = parameters::get_attribute_as<bool>("pno_mode", reader, template_reader, false);
            serialize_plan = parameters::get_attribute_as<bool>("serialize_plan", reader, template_reader, false);

            if( parameters::has_attribute("solutions_colors", reader, template_reader) )
                solutions_colors = parameters::get_attribute_as<std::vector<std::string> >("solutions_colors", reader, template_reader);
            else
                solutions_colors.push_back("white");

            if( parameters::has_attribute("visualization_bodies", reader, template_reader) )
                visualization_bodies = parameters::get_attribute_as<std::vector<std::string> >("visualization_bodies", reader, template_reader);
            else if( parameters::has_attribute("visualization_body", reader, template_reader) )
                visualization_bodies = parameters::get_attribute_as<std::vector<std::string> >("visualization_body", reader, template_reader);
            else
                PRX_WARN_S("Visualization_systems have not been specified for PRM motion planner!");

            similarity_threshold = parameters::get_attribute_as<double>("similarity_threshold", reader, template_reader, PRX_DISTANCE_CHECK);
            execute_num = 0;
        }

        void prm_star_t::reset()
        {
            // PRX_DEBUG_COLOR("PRM* is getting reset, dummy!", PRX_TEXT_RED);
            std::vector<undirected_vertex_index_t> to_delete;

            foreach(undirected_vertex_index_t v, boost::vertices(graph.graph))
            {
                to_delete.push_back(v);
            }

            foreach(undirected_vertex_index_t v, to_delete)
            {

                foreach(undirected_vertex_index_t u, boost::adjacent_vertices(v, graph.graph))
                {
                    undirected_edge_index_t e = boost::edge(v, u, graph.graph).first;
                    graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                }
                graph.clear_and_remove_vertex(v);
            }

            metric->clear();
            path1.clear();
            path2.clear();
            update_k(0);
            last_solution_length = PRX_INFINITY;
        }

        void prm_star_t::link_specification(specification_t* new_spec)
        {
            motion_planner_t::link_specification(new_spec);

            if( input_specification->astar != NULL )
            {
                if( astar != NULL )
                {
                    PRX_WARN_S("PRM's A* module will replaced with the A* module from specification!");
                    delete astar;
                }
                astar = input_specification->astar;
            }
            if( astar == NULL )
                PRX_FATAL_S("No A* module has been specified in motion planner " << path);

        }

        void prm_star_t::setup()
        {
            //DEBUG: for sanity's sake, make sure k is updated before we add any seeds, in the case that there are things already in the graph
            update_k(num_vertices);
            // PRX_DEBUG_COLOR("\n\nPRM* SETUP!\n", PRX_TEXT_RED);
            // PRX_DEBUG_COLOR("Setting up PRM* : " << num_vertices << " (" << k << ")", PRX_TEXT_MAGENTA);

            random_point = state_space->alloc_point();
            path1.link_space(state_space);
            path2.link_space(state_space);
            new_plan.link_control_space(control_space);
            new_plan2.link_control_space(control_space);
            new_plan.link_state_space(state_space);
            new_plan2.link_state_space(state_space);

            std::vector<state_t*>& seeds = input_specification->get_seeds();
            std::vector<bool>& valid_seeds = input_specification->get_validity();
            for( size_t i = 0; i < seeds.size(); ++i )
            {
                if( validity_checker->is_valid(seeds[i]) )
                {
                    // PRX_DEBUG_COLOR("GOOD [" << i << "] seed", PRX_TEXT_GREEN);
                    valid_seeds[i] = true;
                    add_node(seeds[i]);
                    update_k(num_vertices);
                }
                else
                {
                    // PRX_DEBUG_COLOR("BAD  [" << i << "] seed", PRX_TEXT_RED);
                    valid_seeds[i] = false;
                }
            }

            astar->link_spaces(state_space, control_space);
            astar->link_modules(validity_checker, local_planner);
            astar->link_distance_metric(metric);
        }

        bool prm_star_t::execute()
        {
            PRX_ASSERT(input_specification != NULL);

            // This is something that people didn't want to have it in the motion planner 
            // so we had to overwrite the execute function for the roadmap motion planners.
            if(deserialize_flag)
            {
                return deserialize();
            }
            
            do
            {
                // PRX_INFO_S("EXECUTE FROM MOTION PLANNER");
                step();
            }
            while( !input_specification->get_stopping_criterion()->satisfied() );
            
            return succeeded();
        }

        void prm_star_t::step()
        {
            valid_random_sample();
            add_node(random_point);
            update_k(num_vertices);
            // if( execute_num % 100 == 0 )
            // {
            //     PRX_PRINT("PRM STAR vertex " << num_vertices, PRX_TEXT_LIGHTGRAY);
            // }
            // PRX_PRINT("PRM STAR iteration " << execute_num, PRX_TEXT_LIGHTGRAY);
            execute_num++;
        }

        bool prm_star_t::succeeded() const
        {
            PRX_INFO_S("prm_star_t");
            if( input_specification->get_stopping_criterion()->satisfied() )
                return true;
            return false;
        }

        void prm_star_t::resolve_query()
        {
            // PRX_DEBUG_COLOR("PRM* Resolve Query: " << path, PRX_TEXT_BLUE);

            //PRX_DEBUG_COLOR("Vertices::: " << boost::num_vertices(graph.graph) << ", Edges::: " << boost::num_edges(graph.graph), PRX_TEXT_BLUE);
            double path_length = 0;

            //astar->setup_spaces(local_planner->get_state_space(), local_planner->get_control_space());


            //            PRX_DEBUG_COLOR("PRM CC: " << boost::connected_components(graph.graph,graph.components) << "   |V|:" << boost::num_vertices(graph.graph) << "   |E|:" << boost::num_edges(graph.graph), PRX_TEXT_MAGENTA);
            //PRX_WARN_S("Inside resolve query");
            sys_clock_t resolve_timer;
            resolve_timer.reset();
            unsigned goals_size;
            std::vector<space_point_t*> goals = input_query->get_goal()->get_goal_points(goals_size);
            std::vector<undirected_vertex_index_t> v_goals;
            v_goals.clear();

            if( input_query->q_type == motion_planning_query_t::PRX_ADD_QUERY_POINTS_NO_COLLISIONS )
                no_collision_query_type = true;
            else if( input_query->q_type == motion_planning_query_t::PRX_NEAR_QUERY_POINTS )
                near_query_type = true;

            //    PRX_DEBUG_S ("Num vertices: " << boost::num_vertices(graph.graph));
            //    PRX_DEBUG_S ("Num edges: " << boost::num_edges(graph.graph));

            //            int old_num_edges_start = boost::num_edges(graph.graph);
            undirected_vertex_index_t v_start;
            boost::tie(remove_start, v_start) = add_node(input_query->get_start_state());
            //            PRX_DEBUG_COLOR("Adding Start: " << state_space->print_point(input_query->get_start_state(),4), PRX_TEXT_BLUE)
            //            PRX_DEBUG_COLOR("PRM CC: " << boost::connected_components(graph.graph,graph.components) << "   |V|:" << boost::num_vertices(graph.graph) << "   |E|:" << boost::num_edges(graph.graph)  << "   k:" << k, PRX_TEXT_MAGENTA);
            //            int new_num_edges_start = boost::num_edges(graph.graph);

            //PRX_ERROR_S ("Edges connected to start: " << new_num_edges_start - old_num_edges_start);
            //PRX_ERROR_S("Start state: " << state_space->print_point(input_query->get_start_state()));
            //    PRX_DEBUG_S ("Num vertices #2: " << boost::num_vertices(graph.graph));
            //    PRX_DEBUG_S ("Num edges #2: " << boost::num_edges(graph.graph));

            undirected_vertex_index_t v_g;
            bool remove_goal;

            for(unsigned i=0; i<goals_size; ++i)
            {
                boost::tie(remove_goal, v_g) = add_node(goals[i]);
                v_goals.push_back(v_g);
                //                PRX_DEBUG_COLOR("Adding v_goal to the v_goals : " << v_goals.size(), PRX_TEXT_CYAN);
                remove_goals.push_back(remove_goal);
            }

            // PRX_DEBUG_COLOR("Start has valence: " << boost::out_degree(v_start, graph.graph), PRX_TEXT_BLUE);
            // PRX_DEBUG_COLOR("Start is: " << state_space->print_point( graph[v_start]->point, 3 ), PRX_TEXT_LIGHTGRAY);

            bool start_valid = validity_checker->is_valid(graph[v_start]->point);

            //Now, let's just check to see there is some goal that is reachable before we do anything else.
            bool good_to_go = false;
            unsigned num_component = boost::connected_components(graph.graph, graph.components);
            for( unsigned i = 0; i < v_goals.size() && start_valid; ++i )
            {
                // PRX_DEBUG_COLOR("Checking goal: " << i << " with valence: " << boost::out_degree(v_goals[i], graph.graph), PRX_TEXT_CYAN);
                // PRX_DEBUG_COLOR("Goal: " << state_space->print_point( graph[v_goals[i]]->point, 3), PRX_TEXT_LIGHTGRAY);
                // PRX_DEBUG_COLOR("Goal is: " << v_goals[i], PRX_TEXT_LIGHTGRAY);
                if( graph.components[v_start] == graph.components[v_goals[i]] && validity_checker->is_valid( graph[v_goals[i]]->point ) )
                {
                    good_to_go = true;
                    break;
                }
            }

            // PRX_INFO_S("|components| = " << num_component);
            if(!good_to_go || !start_valid)
            {
                PRX_WARN_S("Start and goal(s) are not in the same connected component: |components| = " << num_component);

                if( remove_start )
                {

                    foreach(undirected_vertex_index_t u, boost::adjacent_vertices(v_start, graph.graph))
                    {
                        undirected_edge_index_t e = boost::edge(v_start, u, graph.graph).first;
                        graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                        e = boost::edge(u, v_start, graph.graph).first;
                        graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                    }

                    metric->remove_point(graph.get_vertex_as<undirected_node_t > (v_start));
                    graph.clear_and_remove_vertex(v_start);
                    num_vertices--;
                }

                for( size_t i = 0; i < v_goals.size(); ++i )
                {
                    if( remove_goals[i] )
                    {
                        v_g = v_goals[i];


                        foreach(undirected_vertex_index_t u, boost::adjacent_vertices(v_g, graph.graph))
                        {
                            undirected_edge_index_t e = boost::edge(v_g, u, graph.graph).first;
                            graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                            e = boost::edge(u, v_g, graph.graph).first;
                            graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                        }
                        metric->remove_point(graph.get_vertex_as<undirected_node_t > (v_g));
                        graph.clear_and_remove_vertex(v_g);
                        num_vertices--;
                    }
                }
                remove_goals.clear();

                return;
            }
            // PRX_DEBUG_COLOR("Start and Goal are graph-connected.  Starting A*:", PRX_TEXT_LIGHTGRAY);
            // int goal_edges = boost::num_edges(graph.graph);
            //PRX_ERROR_S ("Edges connected to goal: " << goal_edges -  new_num_edges_start);

            //            PRX_DEBUG_COLOR("metric size: " << metric->get_nr_points() << "     q_collision_type: " << input_query->q_collision_type, PRX_TEXT_BROWN);
            astar->link_graph(&graph);
            input_query->plan.clear();
            input_query->path.clear();

            //PRX_INFO_S("start: " << state_space->print_point(graph[v_start]->point, 3));
            //PRX_INFO_S("end  : " << state_space->print_point(graph[v_goals[0]]->point, 3));
            //PRX_INFO_S("query collision type : " << input_query->q_collision_type);
            if( input_query->q_collision_type == motion_planning_query_t::PRX_LAZY_COLLISIONS )
            {
                bool found_path = false;
                // PRX_DEBUG_COLOR(" START OF ASTAR " << state_space->print_point(graph.get_vertex_as<prm_star_node_t > (v_start)->point, 4), PRX_TEXT_GREEN);
                // PRX_DEBUG_COLOR(" STOP OF ASTAR " << state_space->print_point(graph.get_vertex_as<prm_star_node_t > (v_goals[0])->point, 4), PRX_TEXT_RED);
                int reruns = 0;
                while( !found_path )
                {
                    PRX_ASSERT(graph.components[v_start] == graph.components[v_goals[0]]);

                    astar->set_astar_mode(astar_module_t::PRX_NO_EDGE_INFO);
                    // PRX_DEBUG_COLOR("About to start A* solve...", PRX_TEXT_LIGHTGRAY);
                    if( astar->solve(v_start, v_goals) )
                    {
                        std::deque< undirected_vertex_index_t > path_vertices;
                        astar->extract_path(v_start, astar->get_found_goal(), path_vertices);
                        // PRX_DEBUG_COLOR("ASTAR FOUND A PATH size:" << path_vertices.size(), PRX_TEXT_BLUE);
                        bool valid_path = true;
                        path_length = 0;
                        for( size_t i = 0; i < path_vertices.size() - 1; ++i )
                        {
                            undirected_edge_index_t e = boost::edge(path_vertices[i], path_vertices[i + 1], graph.graph).first;

                            // prm_star_edge_t* edge = graph.get_edge_as<prm_star_edge_t > (e);

                            // PRX_DEBUG_COLOR("[" << i << "]: " << state_space->print_point( graph[path_vertices[i]]->point, 3 ), PRX_TEXT_CYAN);

                            path1.clear();
                            new_plan.clear();
                            local_planner->steer(graph[path_vertices[i]]->point, graph[path_vertices[i + 1]]->point, new_plan, path1);
                            path_length += path1.length();
                            //                            PRX_DEBUG_COLOR("THE EDGE STORED IN THE GRAPH IS ... " << edge->plan.size() << "... path... " << edge->path.size() << "   computed plan: " << new_plan.size() << "   computed path: " << path1.size(), PRX_TEXT_LIGHTGRAY);


                            if( !validity_checker->is_valid(path1) )
                            {
                                astar->block_edge(e);
                                valid_path = false;
                                //                                PRX_PRINT("Blocked edge in astar :: " << state_space->print_point(graph[path_vertices[i]]->point, 3) << " ], [" << state_space->print_point(graph[path_vertices[i + 1]]->point, 3), PRX_TEXT_BLUE);
                            }
                            else if( valid_path )
                            {

                                //                                foreach(plan_step_t step, new_plan)
                                //                                {
                                //                                    input_query->plan.copy_onto_back(step.control, step.duration);
                                //                                }
                                input_query->plan += new_plan;
                                input_query->path += path1;
                                //PRX_DEBUG_POINT(path1.print());
                            }

                        }
                        // PRX_DEBUG_COLOR("[" << path_vertices.size() - 1 << "]: " << state_space->print_point( graph[path_vertices[path_vertices.size() - 1]]->point, 3 ), PRX_TEXT_CYAN);
                        found_path = valid_path;
                        if( !found_path )
                        {
                            reruns++;
                            input_query->plan.clear();
                            input_query->path.clear();
                        }

                    }
                    else
                    {
                        //There is no path and we have to stop searching
                        PRX_PRINT("No solution to astar", PRX_TEXT_RED);
                        break;
                    }

                }
                input_query->found_solution = found_path;
                //PRX_PRINT(found_path << " ... " << (graph.components[v_start] == graph.components[v_goals[0]]) << "... plan[" << input_query->plan.size() << "] Path Length::: " << path_length, PRX_TEXT_BROWN);
            }
            else if( input_query->q_collision_type == motion_planning_query_t::PRX_ACTIVE_COLLISIONS_REPROPAGATE_EDGES )
            {
                astar->restart();
                astar->set_astar_mode(astar_module_t::PRX_REPROPAGATE_EDGE_INFO);
                // PRX_DEBUG_COLOR("PRX_ACTIVE_COLLISIONS_REPROPAGATE_EDGES", PRX_TEXT_GREEN);

                if( astar->solve(v_start, v_goals) )
                {
                    PRX_INFO_S("Found a path for PRX_REPROPAGATE_EDGE_INFO");
                    std::deque<undirected_vertex_index_t> path_vertices;
                    astar->extract_path(v_start, astar->get_found_goal(), path_vertices);
                    //                    PRX_DEBUG_COLOR("Astar found solution : " << path_vertices.size(), PRX_TEXT_BROWN);

                    for( size_t i = 0; i < path_vertices.size() - 1; ++i )
                    {
                        path1.clear();
                        new_plan.clear();
                        local_planner->steer(graph[path_vertices[i]]->point, graph[path_vertices[i + 1]]->point, new_plan, path1);

                        //                        foreach(plan_step_t step, new_plan)
                        //                        {
                        //                            input_query->plan.copy_onto_back(step.control, step.duration);
                        //                        }

                        input_query->plan += new_plan;
                        input_query->path += path1;
                        PRX_DEBUG_COLOR("new plan: " << new_plan.size() << "   query->plan:" << input_query->plan.size(), PRX_TEXT_MAGENTA);
                    }
                    input_query->found_solution = true;
                }
            }
            else
            {
                bool found_path = false;

                if( input_query->q_collision_type == motion_planning_query_t::PRX_NO_COLLISIONS )
                {
                    astar->set_astar_mode(astar_module_t::PRX_NO_EDGE_INFO);
                    found_path = astar->solve(v_start, v_goals);
                    PRX_INFO_S("Found a path (" << found_path << ") for PRX_NO_COLLISIONS");
                }
                else if( input_query->q_collision_type == motion_planning_query_t::PRX_ACTIVE_COLLISIONS_REUSE_EDGES )
                {
                    astar->restart();
                    astar->set_astar_mode(astar_module_t::PRX_REUSE_EDGE_INFO);
                    found_path = astar->solve(v_start, v_goals);
                    // PRX_INFO_S("Found a path (" << found_path << ") for PRX_ACTIVE_COLLISIONS_REUSE_EDGES");
                }

                if( found_path )
                {
                    std::deque<undirected_vertex_index_t> path_vertices;
                    astar->extract_path(v_start, astar->get_found_goal(), path_vertices);
                    // PRX_INFO_S("Astar found solution : " << path_vertices.size());
                    input_query->found_solution = true;
                    for( size_t i = 0; i < path_vertices.size() - 1; ++i )
                    {
                        undirected_edge_index_t e = boost::edge(path_vertices[i], path_vertices[i + 1], graph.graph).first;
                        //                        PRX_DEBUG_POINT("edge plan size: " << graph.get_edge_as<prm_star_edge_t > (e)->plan.size() << "     path_size:" << graph.get_edge_as<prm_star_edge_t > (e)->path.size());
                        bool path_exists = graph.get_edge_as<prm_star_edge_t > (e)->path.size() > 0;
                        bool plan_exists = graph.get_edge_as<prm_star_edge_t > (e)->plan.size() > 0;

                        if( i != 0 )
                        {
                            input_query->path.resize(input_query->path.size() - 1);
                        }

                        if( path_exists && plan_exists )
                        {
                            input_query->path += graph.get_edge_as<prm_star_edge_t > (e)->path;
                            input_query->plan += graph.get_edge_as<prm_star_edge_t > (e)->plan;
                        }
                        else if( plan_exists && !path_exists )
                        {
                            path1.clear();
                            local_planner->propagate(graph[path_vertices[i]]->point, graph.get_edge_as<prm_star_edge_t > (e)->plan, path1);
                            input_query->path += path1;
                            input_query->plan += graph.get_edge_as<prm_star_edge_t > (e)->plan;
                        }
                        else if( path_exists && !plan_exists )
                        {
                            new_plan.clear();
                            local_planner->steer(graph[path_vertices[i]]->point, graph[path_vertices[i + 1]]->point, new_plan, random_point);

                            input_query->plan += new_plan;
                            input_query->path += graph.get_edge_as<prm_star_edge_t > (e)->path;
                        }
                        else
                        {
                            path1.clear();
                            new_plan.clear();
                            local_planner->steer(graph[path_vertices[i]]->point, graph[path_vertices[i + 1]]->point, new_plan, path1);

                            input_query->plan += new_plan;
                            input_query->path += path1;
                        }
                    }
                }
            }

            if( remove_start )
            {

                foreach(undirected_vertex_index_t u, boost::adjacent_vertices(v_start, graph.graph))
                {
                    undirected_edge_index_t e = boost::edge(v_start, u, graph.graph).first;
                    graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                    e = boost::edge(u, v_start, graph.graph).first;
                    graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                }

                metric->remove_point(graph.get_vertex_as<undirected_node_t > (v_start));
                graph.clear_and_remove_vertex(v_start);
                num_vertices--;
            }

            for( size_t i = 0; i < v_goals.size(); ++i )
            {
                if( remove_goals[i] )
                {
                    v_g = v_goals[i];


                    foreach(undirected_vertex_index_t u, boost::adjacent_vertices(v_g, graph.graph))
                    {
                        undirected_edge_index_t e = boost::edge(v_g, u, graph.graph).first;
                        graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                        e = boost::edge(u, v_g, graph.graph).first;
                        graph.get_edge_as<prm_star_edge_t > (e)->clear(control_space);
                    }
                    metric->remove_point(graph.get_vertex_as<undirected_node_t > (v_g));
                    graph.clear_and_remove_vertex(v_g);
                    num_vertices--;
                }
            }

            v_goals.clear();
            remove_goals.clear();

            no_collision_query_type = false;
            near_query_type = false;
        }

        void prm_star_t::update_vis_info() const
        {

            //PRX_WARN_S("visualization_bodies.size() : " << visualization_bodies.size() << "     visualize_graph : " << visualize_graph);
            if( visualization_bodies.size() <= 0 )
                return;

            std::vector<geometry_info_t> geoms;
            std::vector<config_t> configs;
            hash_t<std::string, std::vector<double> > map_params;
            std::vector<double> params;

            int count;

            if( visualize_graph )
            {

                count = 0;
                std::vector<std::string> system_names;
                system_names.push_back(visualization_bodies[0]);
                //PRX_INFO_S("visualize_graph : " << visualize_graph << "     systems_name size: " << system_names.size() << "    name: " << system_names[0]);

                //                foreach(undirected_edge_index_t e, boost::edges(graph.graph))
                //                {
                //
                //                    params.clear();
                //
                //                    PRX_WARN_S("edge size: " << graph.get_edge_as<prm_star_edge_t > (e)->path.size());
                //                    for( int i = 0; i < graph.get_edge_as<prm_star_edge_t > (e)->path.size() - 1; ++i )
                //                    {
                //
                //
                //                        std::string name = ros::this_node::getName() + visualization_graph_name + "/edge_" + int_to_str(count);
                //                        params.clear();
                //
                //                        map_params.clear();
                //                        ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(graph.get_edge_as<prm_star_edge_t > (e)->path[i], system_names, map_params);
                //                        params.insert(params.end(), map_params[system_names[0]].begin(), map_params[system_names[0]].end());
                //                        PRX_INFO_S("source( " << state_space->print_point(graph.get_edge_as<prm_star_edge_t > (e)->path[i], 2) << ")  params size: " << params.size());
                //
                //                        map_params.clear();
                //                        ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(graph.get_edge_as<prm_star_edge_t > (e)->path[i + 1], system_names, map_params);
                //                        params.insert(params.end(), map_params[system_names[0]].begin(), map_params[system_names[0]].end());
                //                        PRX_INFO_S("target( " << state_space->print_point(graph.get_edge_as<prm_star_edge_t > (e)->path[i+1], 2) << ")  params size: " << params.size());
                //
                //                        geoms.push_back(geometry_info_t(visualization_bodies[0], name, PRX_LINESTRIP, params, graph_color));
                //                        configs.push_back(config_t());
                //                        count++;
                //
                //                    }
                //                }

                foreach(undirected_edge_index_t e, boost::edges(graph.graph))
                {
                    std::string name = ros::this_node::getName() + visualization_graph_name + "/edge_" + int_to_str(count);
                    params.clear();

                    //PRX_WARN_S("edge size: " << graph.get_edge_as<prm_star_edge_t > (e)->path.size());

                    map_params.clear();
                    ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(graph[boost::source(e, graph.graph)]->point, system_names, map_params);
                    params.insert(params.end(), map_params[system_names[0]].begin(), map_params[system_names[0]].end());
                    //                    PRX_INFO_S("source( " << state_space->print_point(graph[boost::source(e, graph.graph)]->point,2) << ")  params size: " << params.size());


                    map_params.clear();
                    ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(graph[boost::target(e, graph.graph)]->point, system_names, map_params);
                    params.insert(params.end(), map_params[system_names[0]].begin(), map_params[system_names[0]].end());
                    //                    PRX_INFO_S("target( " << state_space->print_point(graph[boost::target(e, graph.graph)]->point,2) << ")  params size: " << params.size());

                    geoms.push_back(geometry_info_t(visualization_bodies[0], name, PRX_LINESTRIP, params, graph_color));
                    configs.push_back(config_t());
                    count++;
                }

                ((comm::visualization_comm_t*)comm::vis_comm)->visualization_geom_map[visualization_graph_name] = geoms;
                ((comm::visualization_comm_t*)comm::vis_comm)->visualization_configs_map[visualization_graph_name] = configs;
                geoms.clear();
                configs.clear();
            }


            if( visualize_solutions && input_query->path.size() > 0 )
            {

                hash_t<std::string, std::vector<double> > to_map_params;
                count = 0;
                for( size_t i = 0; i < input_query->path.size() - 1; i++ )
                {
                    map_params.clear();
                    to_map_params.clear();

                    ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(input_query->path[i], visualization_bodies, map_params);
                    ((comm::visualization_comm_t*)comm::vis_comm)->compute_configs(input_query->path[i + 1], visualization_bodies, to_map_params);

                    for( size_t s = 0; s < visualization_bodies.size(); s++ )
                    {
                        params.clear();
                        params.insert(params.end(), map_params[visualization_bodies[s]].begin(), map_params[visualization_bodies[s]].end());
                        params.insert(params.end(), to_map_params[visualization_bodies[s]].begin(), to_map_params[visualization_bodies[s]].end());

                        std::string name = ros::this_node::getName() + visualization_solutions_name + "/" + visualization_bodies[s] + "/path_" + int_to_str(count);

                        geoms.push_back(geometry_info_t(visualization_bodies[s], name, PRX_LINESTRIP, params, solutions_colors[s % solutions_colors.size()]));
                        configs.push_back(config_t());
                        count++;
                    }
                }

                ((comm::visualization_comm_t*)comm::vis_comm)->visualization_geom_map[visualization_solutions_name] = geoms;
                ((comm::visualization_comm_t*)comm::vis_comm)->visualization_configs_map[visualization_solutions_name] = configs;
                geoms.clear();
                configs.clear();
            }
        }

        void prm_star_t::valid_random_sample()
        {
            do
            {
                //TODO : we should remove that code someday :)
                //Keep that code here for the embedded link point.
                //You need to allocate a new point every time so as the
                //collision checker will know the new point.
                //        if( random_point != NULL )
                //        {
                //            state_space->free_point( random_point );
                //        }
                //        //Up to here to remove :)
                //        random_point = state_space->alloc_point();
                sampler->sample(state_space, random_point);
                ++num_generated;
            }
            while( !(validity_checker->is_valid(random_point)) );
        }

        std::pair<bool, util::undirected_vertex_index_t> prm_star_t::add_node(const space_point_t* n_state)
        {
            if( metric->get_nr_points() > 0 )
            {
                const prm_star_node_t* node = metric->single_query(n_state)->as<prm_star_node_t > ();
                if( node != NULL && (near_query_type || metric->distance_function(n_state, node->point) <= similarity_threshold) )
                {
                    // PRX_DEBUG_COLOR("The point is already in the graph : " << state_space->print_point(n_state, 4), PRX_TEXT_BROWN);
                    return std::make_pair(false, node->index);
                }
            }

            v_new = graph.add_vertex<prm_star_node_t > ();
            num_vertices++;
            graph.get_vertex_as<prm_star_node_t > (v_new)->init_node(state_space, n_state);
            // PRX_DEBUG_COLOR("New node: " << state_space->print_point(graph[v_new]->point, 3), PRX_TEXT_BROWN);

            if( delta_prm )
                connect_node(v_new, r_n);
            else
                connect_node(v_new);

            return std::make_pair(true, v_new);
        }

        void prm_star_t::connect_node(undirected_vertex_index_t v)
        {
            std::vector<const abstract_node_t*> neighbors;
            neighbors = metric->multi_query(graph[v], k);

            link_node_to_neighbors(v, neighbors);

            //add the generated node to the metric module. Add node is not doing it
            //so as the nearest neighbor will not return itself.
            if( metric->has_point(graph[v]) )
            {
                PRX_WARN_S("Metric already has the point! Skipped add");
            }
            else
                metric->add_point(graph[v]);
        }

        void prm_star_t::connect_node(undirected_vertex_index_t v, double rad)
        {
            std::vector< const abstract_node_t* > neighbors;
            neighbors = metric->radius_query(graph[v], rad);

            link_node_to_neighbors(v, neighbors);

            //add the generated node to the metric module. Add node is not doing it
            //so as the nearest neighbor will not return itself.
            if( metric->has_point(graph[v]) )
            {
                PRX_WARN_S("Metric already has the point! Skipped add");
            }
            else
                metric->add_point(graph[v]);
        }

        void prm_star_t::link_node_to_neighbors(undirected_vertex_index_t v, const std::vector< const abstract_node_t* >& neighbors)
        {
            const undirected_node_t* node;

            // PRX_DEBUG_COLOR("Linking node: " << v, PRX_TEXT_GREEN);
            // PRX_DEBUG_COLOR("Linking to neighbors: " << neighbors.size(), PRX_TEXT_RED);

            path1.clear();
            for( size_t i = 0; i < neighbors.size(); i++ )
            {
                node = neighbors[i]->as< undirected_node_t > ();
                new_plan.clear();

                local_planner->steer(graph[v]->point, node->point, new_plan, path1);

                //If the path is valid
                if( new_plan.size() != 0 && is_valid_trajectory(path1) )
                {
                    //Add the edge to the graph
                    double dist = metric->distance_function(graph[v]->point, node->point);
                    undirected_edge_index_t e = graph.add_edge< prm_star_edge_t > (v, node->index, dist);
                    graph.get_edge_as<prm_star_edge_t > (e)->id = num_edges;
                    num_edges++;
                    if( visualize_graph )
                        graph.get_edge_as< prm_star_edge_t > (e)->path = path1;
                }
                // else
                // {
                //     PRX_DEBUG_COLOR("Plan to neighbor [" << i << "] is invalid!", PRX_TEXT_LIGHTGRAY );
                // }

                path1.clear();
            }
        }

        void prm_star_t::update_k(unsigned nr_nodes)
        {
            if( nr_nodes == 0 )
            {
                k = 0;
                r_n = PRX_ZERO_CHECK;
            }
            else
            {
                double d = state_space->get_dimension();
                double val = (1.0 / d);
                k = PRX_MAXIMUM(std::ceil((log(nr_nodes)*2.7182818284 * (1 + val))), 1);
                if( pno_mode )
                    k *= pow(2.0, d);
                if( delta_prm )
                {
                    r_n = 2 * pow((log(nr_nodes) / (double)nr_nodes)*(1 + val)*(state_space->space_size() / state_space->n_ball_measure(1.0)), val);
                    if( pno_mode )
                    {
                        r_n *= 2;
                        //PRX_DEBUG_COLOR("Radius: " << r_n, PRX_TEXT_GREEN);
                    }
                }
            }
        }

        bool prm_star_t::is_valid_trajectory(const sim::trajectory_t& path)
        {
            if( no_collision_query_type )
                return true;
            return validity_checker->is_valid(path);
        }

        bool prm_star_t::serialize()
        {
            PRX_INFO_S(" Inside PRM serialization now, saving to file: " << serialization_file);
            char* w = std::getenv("PRACSYS_PATH");
            std::string dir(w);
            dir += ("/prx_roadmaps/");
            std::string file = dir + serialization_file;
            PRX_INFO_S("File directory is: " << file);
            std::ofstream fout;
            fout.open(file.c_str());
            PRX_ASSERT(fout.is_open());
            graph.serialize(fout, state_space);

            if( serialize_plan )
            {

                foreach(undirected_edge_index_t e, boost::edges(graph.graph))
                {
                    if( graph.get_edge_as<prm_star_edge_t > (e)->plan.size() > 0 )
                    {
                        graph.get_edge_as<prm_star_edge_t > (e)->plan.save_to_stream(fout);
                    }
                    else
                    {
                        local_planner->steer(graph[boost::source(e, graph.graph)]->point, graph[boost::target(e, graph.graph)]->point, new_plan, path1);
                        new_plan.save_to_stream(fout);
                    }
                }
            }
            fout.close();
            return true;

        }

        bool prm_star_t::deserialize()
        {
            PRX_INFO_S(" Inside PRM deserialization now, opening file: " << deserialization_file);
            char* w = std::getenv("PRACSYS_PATH");
            std::string dir(w);
            dir += ("/prx_roadmaps/");
            std::string file = dir + deserialization_file;
            PRX_INFO_S("File directory is: " << file);
            //            fin.open(file.c_str());
            //            PRX_ASSERT(fin.is_open());
            std::ifstream fin;
            if( !graph.deserialize<prm_star_node_t, prm_star_edge_t > (file, fin, state_space) )
            {
                PRX_FATAL_S("File could not deserialize!");
                return false;
            }
            int counter = 0;
            //    int blah;

            foreach(undirected_edge_index_t e, boost::edges(graph.graph))
            {
                //                boost::source<>()
                //                graph.get_edge_as<prm_star_edge_t > (e).
                //                graph.set_weight()
                double dist = metric->distance_function(graph[boost::source(e, graph.graph)]->point, graph[boost::target(e, graph.graph)]->point);
                graph.set_weight(e, dist);
                graph.get_edge_as<prm_star_edge_t > (e)->id = counter;
                graph.get_edge_as<prm_star_edge_t > (e)->plan.link_control_space(this->control_space);
                graph.get_edge_as<prm_star_edge_t > (e)->plan.link_state_space(this->state_space);
                //graph.get_edge_as<prm_star_edge_t > (e)->plan.read_from_stream(fin);
                counter++;
            }

            double val_mu = (double)boost::num_edges(graph.graph) / (double)boost::num_vertices(graph.graph);
            double diff;
            double val_dev = 0.0;

            foreach(undirected_vertex_index_t nd, boost::vertices(graph.graph))
            {
                PRX_DEBUG_S("Added to metric: " << state_space->print_point(graph.graph[nd].node->point));
                metric->add_point(graph[nd]);
                PRX_DEBUG_S("Metric now has: " << metric->get_nr_points() << " points");
                diff = (double)boost::out_degree(nd, graph.graph) - val_mu;
                val_dev += diff * diff;
            }
            val_dev = sqrt(val_dev);
            num_vertices = boost::num_vertices(graph.graph);
            update_k(num_vertices);
            fin.close();

            // PRX_PRINT("Deserialized roadmap with " << boost::num_vertices(graph.graph) << " vertices ... " << boost::num_edges(graph.graph) << " edges.", PRX_TEXT_MAGENTA);
            // PRX_PRINT("Average Valence: " << val_mu << "   Valence Deviation: " << val_dev, PRX_TEXT_GREEN);

            return true;
        }

        const statistics_t* prm_star_t::get_statistics()
        {
            prm_star_statistics_t* stats = statistics->as<prm_star_statistics_t > ();
            int num = boost::connected_components(graph.graph, graph.components);
            stats->cc_sizes.resize(num);

            foreach(util::undirected_vertex_index_t v, boost::vertices(graph.graph))
            {
                stats->cc_sizes[graph.components[v]]++;
            }
            stats->num_vertices = boost::num_vertices(graph.graph);
            stats->num_edges = boost::num_edges(graph.graph);
            stats->num_connected_components = num;

            return statistics;
        }

    }
}
