# Install script for directory: /home/parallels/Desktop/ROS_workspace/src/prx_utilities

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/parallels/Desktop/ROS_workspace/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities/msg" TYPE FILE FILES
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/rigid_body_info_msg.msg"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/visualization/scene_text_msg.msg"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/planning/planning_query_msg.msg"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/space_msg.msg"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg/Vec4_msg.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities/srv" TYPE FILE FILES
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/remove_plant_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_ghost_plants_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_plant_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/visualize_obstacles_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_twoD_text_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/describe_geometries_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/update_info_geoms_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/create_HUD_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/take_screenshot_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_HUD_element_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/visualization/add_twoD_text_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/planning/query_planner_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/send_plants_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/listen_srv.srv"
    "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/srv/shutdown_node_srv.srv"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities/cmake" TYPE FILE FILES "/home/parallels/Desktop/ROS_workspace/build/prx_utilities/catkin_generated/installspace/prx_utilities-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/parallels/Desktop/ROS_workspace/devel/include/prx_utilities")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/parallels/Desktop/ROS_workspace/devel/share/common-lisp/ros/prx_utilities")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/parallels/Desktop/ROS_workspace/devel/lib/python2.7/dist-packages/prx_utilities")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/parallels/Desktop/ROS_workspace/devel/lib/python2.7/dist-packages/prx_utilities")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/parallels/Desktop/ROS_workspace/build/prx_utilities/catkin_generated/installspace/prx_utilities.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities/cmake" TYPE FILE FILES "/home/parallels/Desktop/ROS_workspace/build/prx_utilities/catkin_generated/installspace/prx_utilities-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities/cmake" TYPE FILE FILES
    "/home/parallels/Desktop/ROS_workspace/build/prx_utilities/catkin_generated/installspace/prx_utilitiesConfig.cmake"
    "/home/parallels/Desktop/ROS_workspace/build/prx_utilities/catkin_generated/installspace/prx_utilitiesConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/prx_utilities" TYPE FILE FILES "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/parallels/Desktop/ROS_workspace/src/prx_utilities/prx" FILES_MATCHING REGEX "/[^/]*\\.hpp$" REGEX "/[^/]*\\.h$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/parallels/Desktop/ROS_workspace/devel/lib/libprx_utilities.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprx_utilities.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

