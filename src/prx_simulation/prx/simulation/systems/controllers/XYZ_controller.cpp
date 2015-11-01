/**
 * @file XYZ_controller.cpp 
 *
 * @copyright Software License Agreement (BSD License)
 * Copyright (c) 2014, Rutgers the State University of New Jersey, New Brunswick 
 * All Rights Reserved.
 * For a full description see the file named LICENSE.
 *
 * Authors: Andrew Dobson, Andrew Kimmel, Athanasios Krontiris, Zakary Littlefield, Rahul Shome, Kostas Bekris
 *
 * Email: pracsys@googlegroups.com
 */

#include "prx/simulation/systems/controllers/XYZ_controller.hpp"
#include "prx/utilities/math/3d_geometry/geometry_info.hpp"
#include <boost/any.hpp>
#include <boost/tuple/tuple.hpp> // boost::tie
#include <boost/assign/list_of.hpp>
#include <pluginlib/class_list_macros.h>
#include <vector>


PLUGINLIB_EXPORT_CLASS(prx::sim::XYZ_controller_t, prx::sim::system_t);


namespace prx
{
    using namespace util;
    using namespace packages::manipulation;
    namespace sim
    {

        XYZ_controller_t::XYZ_controller_t()
        {
        }

        XYZ_controller_t::~XYZ_controller_t() { }

        void XYZ_controller_t::init(const parameter_reader_t * reader, const parameter_reader_t* template_reader)
        {
            PRX_DEBUG_COLOR("Starting XYZ_controller_t::init()...", PRX_TEXT_GREEN);

            controller_t::init(reader, template_reader);

            config_t end_effector_config = *(reader->initialize_new<config_t > ("end_effector_configuration"));
            const quaternion_t end_effector_orientation_temp = end_effector_config.get_orientation();
            quaternion_t end_effector_orientation;
            end_effector_orientation.set(end_effector_orientation_temp.get_x(), end_effector_orientation_temp.get_y(), end_effector_orientation_temp.get_z(), end_effector_orientation_temp.get_w() );

            manipulator = dynamic_cast< manipulator_t* >(get_system("target_controller/manip").get());

            manipulator->FK_solver( manipulator_ee_config, "end_effector_left");
            PRX_DEBUG_COLOR("Initial FK "<<manipulator_ee_config.print(), PRX_TEXT_CYAN);
            manipulator_ee_config.set_orientation(end_effector_orientation);

            for (int i = 0; i < 4; ++i)
            {
                control_memory.push_back(new double);
            }

            input_control_space = new space_t("XYZ|D",control_memory);
            state_t* val = manipulator->get_state_space()->alloc_point();
            output_control_space->copy_from_point(val);
            manipulator->get_state_space()->free_point(val);
            // PRX_DEBUG_COLOR("XYZ_controller "<<output_control_space->print_memory(4),PRX_TEXT_CYAN);

        }

        

        void XYZ_controller_t::show_info_sphere(config_t config, double radius)
        {
            std::vector<util::geometry_info_t> geoms;
            std::vector<util::config_t> configs;
            std::vector<double> params;

            params.push_back(radius);
            geoms.push_back(util::geometry_info_t("XYZ_controller/", "IK_sphere", util::PRX_SPHERE, params, "teal"));
            configs.push_back( config );
            params.clear();
            ((comm::visualization_comm_t*)comm::vis_comm)->visualization_geom_map["XYZ_controller/IK_sphere"] = geoms;
            ((comm::visualization_comm_t*)comm::vis_comm)->visualization_configs_map["XYZ_controller/IK_sphere"] = configs;
            ((comm::visualization_comm_t*)comm::vis_comm)->send_geometries();
        }

        void XYZ_controller_t::compute_control()
        {
            control_t* output_control = output_control_space->alloc_point();


            config_t desired_ee_config;
            desired_ee_config.set_orientation(manipulator_ee_config.get_orientation());
            double x = manipulator_ee_config.get_position()[0];
            double y = manipulator_ee_config.get_position()[1];
            double z = manipulator_ee_config.get_position()[2];
            desired_ee_config.set_position(input_control_space->at(0) + x, input_control_space->at(1) + y, input_control_space->at(2) + z);

            // show_info_sphere(desired_ee_config);
            // PRX_DEBUG_COLOR(output_control_space->print_memory(4),PRX_TEXT_BLUE);

            if(!manipulator->IK_solver( output_control, output_control, desired_ee_config, "base", "end_effector_left" ))
            {
                PRX_STATUS("Unable to compute IK solution"<<desired_ee_config.print());
            }
            else
            {
                PRX_STATUS("Moving to IK solution "<<desired_ee_config.print()); 
            }

            output_control->at(14) = input_control_space->at(3);

            output_control_space->copy_from_point(output_control);
            output_control_space->free_point(output_control);
            subsystems.begin()->second->compute_control();
        }

    }
}
