# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "prx_utilities: 5 messages, 15 services")

set(MSG_I_FLAGS "-Iprx_utilities:/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(prx_utilities_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv" "prx_utilities/rigid_body_info_msg"
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv" "geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv" "geometry_msgs/Quaternion:prx_utilities/Vec4_msg:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg" ""
)

get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv" NAME_WE)
add_custom_target(_prx_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "prx_utilities" "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_msg_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_msg_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_msg_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_msg_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)

### Generating Services
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv"
  "${MSG_I_FLAGS}"
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)
_generate_srv_cpp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
)

### Generating Module File
_generate_module_cpp(prx_utilities
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(prx_utilities_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(prx_utilities_generate_messages prx_utilities_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_cpp _prx_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(prx_utilities_gencpp)
add_dependencies(prx_utilities_gencpp prx_utilities_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS prx_utilities_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_msg_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_msg_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_msg_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_msg_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)

### Generating Services
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv"
  "${MSG_I_FLAGS}"
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)
_generate_srv_lisp(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
)

### Generating Module File
_generate_module_lisp(prx_utilities
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(prx_utilities_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(prx_utilities_generate_messages prx_utilities_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_lisp _prx_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(prx_utilities_genlisp)
add_dependencies(prx_utilities_genlisp prx_utilities_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS prx_utilities_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_msg_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_msg_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_msg_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_msg_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)

### Generating Services
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv"
  "${MSG_I_FLAGS}"
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)
_generate_srv_py(prx_utilities
  "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
)

### Generating Module File
_generate_module_py(prx_utilities
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(prx_utilities_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(prx_utilities_generate_messages prx_utilities_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv" NAME_WE)
add_dependencies(prx_utilities_generate_messages_py _prx_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(prx_utilities_genpy)
add_dependencies(prx_utilities_genpy prx_utilities_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS prx_utilities_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/prx_utilities
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(prx_utilities_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(prx_utilities_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/prx_utilities
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(prx_utilities_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(prx_utilities_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/prx_utilities
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(prx_utilities_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(prx_utilities_generate_messages_py std_msgs_generate_messages_py)
