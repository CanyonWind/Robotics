/**
 * @file astar_search.cpp
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2014, Rutgers the State University of New Jersey, New Brunswick
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Justin Cardoza, Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "prx/utilities/heuristic_search/astar_search.hpp"
#include "prx/utilities/definitions/defs.hpp"
#include "prx/utilities/definitions/random.hpp"
#include <algorithm>
#include <boost/graph/connected_components.hpp>

namespace prx
{
    namespace util
    {
        const boost::default_color_type astar_search_t::WHITE = boost::white_color;
        const boost::default_color_type astar_search_t::GRAY = boost::gray_color;
        const boost::default_color_type astar_search_t::BLACK = boost::black_color;

        astar_search_t::astar_search_t()
        {
            distance_function = NULL;
            randomized_weights = true;
        }

        astar_search_t::astar_search_t(undirected_graph_t *g)
        {
            link_graph(g);
        }

        astar_search_t::~astar_search_t()
        {
        }

        void astar_search_t::link_graph(undirected_graph_t *g)
        {
            graph = g;
        }

        void astar_search_t::link_distance_function( distance_function_t* f )
        {
            distance_function = f;
        }

        bool astar_search_t::solve(undirected_vertex_index_t start, const std::vector<undirected_vertex_index_t>& goals)
        {
            undirected_vertex_index_t u, v;
            undirected_edge_index_t e;
            double dist, weight;
            std::vector<undirected_vertex_index_t>::const_iterator goalIterator;

            foreach(u, boost::vertices(graph->graph))
            {
                initialize_vertex(u);
                graph->distances[u] = PRX_INFINITY;
                graph->colors[u] = WHITE;
                graph->predecessors[u] = u;
            }

            open_set.clear();
            openset_insert_node(start, start, heuristic(start, goals));
            graph->colors[start] = GRAY;
            graph->distances[start] = 0;
            discover_vertex(start);

            while( !open_set.empty() )
            {
                astar_node_t* u_node = open_set.remove_min();
                u = u_node->vertex;
                if( !examine_vertex(u) )
                {
                    continue;
                }

                goalIterator = std::find(goals.begin(), goals.end(), u);
                if( goalIterator != goals.end() )
                {
                    foundGoal = *goalIterator;
                    return true;
                }

                foreach(v, boost::adjacent_vertices(u, graph->graph))
                {
                    e = boost::edge(u, v, graph->graph).first;
                    dist = graph->weights[e] + graph->distances[u];
                    if( examine_edge(u, e, v) && dist < graph->distances[v] )
                    {
                        graph->distances[v] = dist;
                        graph->predecessors[v] = u;
                        relaxed_edge(e);
                        if( graph->colors[v] == WHITE )
                        {
                            graph->colors[v] = GRAY;
                            weight = randomized_weights ? ( 1.0 + (uniform_random()/10.0) ) : (1.0);
                            openset_insert_node(u, v, dist + weight*heuristic(v, goals));
                            discover_vertex(v);
                        }
                    }
                    else
                    {
                        not_relaxed_edge(e);
                    }
                }

                graph->colors[u] = BLACK;
                finish_vertex(u);
                delete u_node;
            }

            return false;
        }

        bool astar_search_t::solve(undirected_vertex_index_t start, undirected_vertex_index_t goal)
        {
            undirected_vertex_index_t u, v;
            undirected_edge_index_t e;
            double dist, weight;

            foreach(u, boost::vertices(graph->graph))
            {
                initialize_vertex(u);
                graph->distances[u] = PRX_INFINITY;
                graph->colors[u] = WHITE;
                graph->predecessors[u] = u;
            }

            open_set.clear();
            openset_insert_node(start, start, heuristic(start, goal));
            graph->colors[start] = GRAY;
            graph->distances[start] = 0;
            discover_vertex(start);

            while( !open_set.empty() )
            {
                astar_node_t* u_node = open_set.remove_min();
                u = u_node->vertex;
                if( !examine_vertex(u) )
                {
                    continue;
                }

                if( check_if_goal_found(u,goal) )
                {
                    foundGoal = goal;
                    return true;
                }

                foreach(v, boost::adjacent_vertices(u, graph->graph))
                {
                    e = boost::edge(u, v, graph->graph).first;
                    dist = graph->weights[e] + graph->distances[u];
                    if( examine_edge(u, e, v) && dist < graph->distances[v] )
                    {
                        graph->distances[v] = dist;
                        graph->predecessors[v] = u;
                        relaxed_edge(e);
                        if( graph->colors[v] == WHITE )
                        {
                            graph->colors[v] = GRAY;
                            weight = randomized_weights ? ( 1.0 + (uniform_random()/10.0) ) : (1.0);
                            openset_insert_node(u, v, dist + weight*heuristic(v, goal));
                            discover_vertex(v);
                        }
                    }
                    else
                    {
                        not_relaxed_edge(e);
                    }
                }

                graph->colors[u] = BLACK;
                finish_vertex(u);
                delete u_node;
            }

            return false;
        }

        undirected_vertex_index_t astar_search_t::get_found_goal() const
        {
            return foundGoal;
        }

        void astar_search_t::extract_path(undirected_vertex_index_t start, undirected_vertex_index_t goal, std::deque<undirected_vertex_index_t>& vertices)
        {
            vertices.clear();

            for( undirected_vertex_index_t v = goal; v != start; v = graph->predecessors[v] )
            {
                vertices.push_front(v);
            }

            vertices.push_front(start);
        }

        double astar_search_t::heuristic(undirected_vertex_index_t current, undirected_vertex_index_t goal)
        {
            if( distance_function != NULL )
            {
                undirected_node_t *s, *t;
                s = graph->get_vertex_as<undirected_node_t > (current);
                t = graph->get_vertex_as<undirected_node_t > (goal);
                return distance_function->distance( s->point, t->point );
            }
            return 0;
        }

        double astar_search_t::heuristic(undirected_vertex_index_t current, const std::vector<undirected_vertex_index_t>& goals)
        {
            double minH, h;
            size_t i;

            PRX_ASSERT( goals.size() > 0 );
            minH = heuristic(current, goals[0]);

            for( i = 1; i < goals.size(); ++i )
            {
                h = heuristic(current, goals[i]);
                if( h < minH )
                    minH = h;
            }

            return minH;
        }

        void astar_search_t::openset_insert_node(undirected_vertex_index_t parent, undirected_vertex_index_t v, double f)
        {
            open_set.insert(new astar_node_t(v, f));
        }

        void astar_search_t::initialize_vertex(undirected_vertex_index_t vertex) { }

        void astar_search_t::discover_vertex(undirected_vertex_index_t vertex) { }

        bool astar_search_t::examine_vertex(undirected_vertex_index_t vertex)
        {
            return true;
        }

        void astar_search_t::finish_vertex(undirected_vertex_index_t vertex) { }

        bool astar_search_t::examine_edge(undirected_vertex_index_t u, undirected_edge_index_t edge, undirected_vertex_index_t v)
        {
            return true;
        }

        void astar_search_t::relaxed_edge(undirected_edge_index_t edge) { }

        void astar_search_t::not_relaxed_edge(undirected_edge_index_t edge) { }
            
        bool astar_search_t::check_if_goal_found(undirected_vertex_index_t potential_goal, undirected_vertex_index_t actual_goal)
        {
            return potential_goal == actual_goal;
        }
    }
}
