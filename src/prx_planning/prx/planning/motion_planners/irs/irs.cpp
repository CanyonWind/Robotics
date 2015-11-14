/**
 * @file irs.cpp
 * 
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2011, Board of Regents, NSHE, obo UNR
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * @authors Athanasios Krontiris, Andrew Dobson, Andrew Kimmel, Zakary Littlefield, James Marble, Kostas Bekris 
 * 
 * Email: pracsys@googlegroups.com
 */

#include "prx/planning/motion_planners/irs/irs_statistics.hpp"
#include "prx/planning/motion_planners/irs/irs.hpp"
#include "prx/utilities/boost/boost_wrappers.hpp"
#include "prx/utilities/distance_metrics/distance_metric.hpp"
#include "prx/planning/modules/samplers/sampler.hpp"
#include "prx/planning/modules/validity_checkers/validity_checker.hpp"
#include "prx/planning/modules/local_planners/local_planner.hpp"

#include <boost/property_map/vector_property_map.hpp>
#include <boost/graph/connected_components.hpp>

#include <pluginlib/class_list_macros.h> 

PLUGINLIB_EXPORT_CLASS(prx::plan::irs_t, prx::plan::planner_t)


namespace prx
{
    using namespace util;
    using namespace plan;

    namespace plan
    {

        irs_t::irs_t() 
        {
            rejected_edges = 0;
            statistics = new irs_statistics_t();
        }

        irs_t::~irs_t() { }

        void irs_t::init(const parameter_reader_t* reader, const parameter_reader_t* template_reader)
        {
            PRX_INFO_S("Initializing IRS motion planner ...");
            prm_star_t::init(reader, template_reader);
            stretch_factor = parameters::get_attribute_as<double>("stretch_factor", reader, template_reader);
            //    max_consecutive_failures = reader->get_attribute_as<unsigned int>("max_consecutive_failures", 100);
            //    delta = reader->get_attribute_as<double>("delta",100);
            
            clock.reset();
        }

        bool irs_t::same_connected_component_in_graph(const undirected_graph_t& g, const undirected_vertex_index_t v1, const undirected_vertex_index_t v2)
        {
            int num = boost::connected_components(g.graph, g.components);

            //    PRX_ERROR_S("No of CC : " << num);
            //    PRX_ERROR_S("[v1,v2]: [" << g.components[v1] << "," << g.components[v2] << "]" );
            if( num == 1 )
                return true;
            if( g.components[v1] == g.components[v2] )
                return true;

            return false;

        }

        bool irs_t::same_connected_component(const undirected_vertex_index_t v1, const undirected_vertex_index_t v2)
        {
            return same_connected_component_in_graph(graph, v1, v2);
        }

        double irs_t::get_path_distance(const undirected_vertex_index_t start, const undirected_vertex_index_t goal)
        {
            double distance = PRX_INFINITY;
            try
            {
                //        PRX_INFO_S("path : " << graph[start] << " , " << graph[goal]);
                //call astar named parameter interface
                astar_search<
                        undirected_graph_type,
                        undirected_graph_t,
                        undirected_vertex_index_t,
                        undirected_node_t
                        > (graph, start, goal, metric);
            }
            catch( prx_found_goal_t fg )
            { // found a path to the goal
                distance = 0;

                //        PRX_WARN_S("Found path");
                for( undirected_vertex_index_t v = goal; v != graph.predecessors[v]; v = graph.predecessors[v] )
                {
                    undirected_edge_index_t e = boost::edge(v, graph.predecessors[v], graph.graph).first;
                    distance += graph.get_weight(e);

                }
                //        PRX_WARN_S("dist : " << distance);
            }
            return distance;
        }

        void irs_t::link_node_to_neighbors(undirected_vertex_index_t v, const std::vector< const abstract_node_t* >& neighbors)
        {
            //Attempt to connect to the node's nearest neighbors
            const undirected_node_t* node;
            for( size_t i = 0; i < neighbors.size(); i++ )
            {
                node = neighbors[i]->as<undirected_node_t > ();

                path1.clear();
                new_plan.clear();

                local_planner->steer(graph[v]->point, node->point, new_plan, path1);
                
                //If the path is valid
                if( validity_checker->is_valid(path1) )
                {
                    double dist = get_path_distance(v, node->index);
                    double new_dist = metric->distance_function(graph[v]->point, node->point);

                    if( !same_connected_component(v, node->index) || dist > stretch_factor * new_dist )
                    {
                        undirected_edge_index_t e = graph.add_edge< prm_star_edge_t > (v, node->index, new_dist);
                        graph.get_edge_as<prm_star_edge_t > (e)->id = num_edges;
                        num_edges++;
                        if( visualize_graph )
                            graph.get_edge_as< prm_star_edge_t >(e)->path = path1;
                    }
                    else
                    {
                        ++rejected_edges;
                    }
                }

                path1.clear();
                path2.clear();
            }
        }
        
        const statistics_t* irs_t::get_statistics()
        {
            statistics_t* returned_stats = new irs_statistics_t();
            
            returned_stats->as< irs_statistics_t >()->num_vertices = boost::num_vertices(graph.graph);
            returned_stats->as< irs_statistics_t >()->num_edges = boost::num_edges(graph.graph);
            returned_stats->as< irs_statistics_t >()->rejected_edges = rejected_edges;
            returned_stats->as< irs_statistics_t >()->elapsed = clock.measure();
            
            return returned_stats;
        }

    }
}



