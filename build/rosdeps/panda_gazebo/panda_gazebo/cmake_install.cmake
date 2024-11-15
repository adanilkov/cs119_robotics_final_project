# Install script for directory: /home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/brl/object_picker/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/msg" TYPE FILE FILES
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/msg/BoundingRegion.msg"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/msg/JointLimits.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/srv" TYPE FILE FILES
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/AddBox.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/AddPlane.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetControlledJoints.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetEe.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetEePose.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetEePoseJointConfig.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetEeRpy.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetMoveItControlledJoints.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetRandomEePose.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/GetRandomJointPositions.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/LockJoints.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetEe.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetEePose.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetGripperWidth.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetJointCommands.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetJointEfforts.srv"
    "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/srv/SetJointPositions.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/action" TYPE FILE FILES "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/action/FollowJointTrajectory.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryAction.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryActionGoal.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryActionResult.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryActionFeedback.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryGoal.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryResult.msg"
    "/home/brl/object_picker/devel/share/panda_gazebo/msg/FollowJointTrajectoryFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/cmake" TYPE FILE FILES "/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/installspace/panda_gazebo-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/include/panda_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/roseus/ros/panda_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/common-lisp/ros/panda_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/gennodejs/ros/panda_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo" FILES_MATCHING REGEX "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/panda_gazebo" TYPE FILE FILES "/home/brl/object_picker/devel/include/panda_gazebo/MoveitServerDynReconfConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/panda_gazebo" TYPE FILE FILES "/home/brl/object_picker/devel/include/panda_gazebo/PositionControlTestDynReconfConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/panda_gazebo" TYPE FILE FILES "/home/brl/object_picker/devel/include/panda_gazebo/EffortControlTestDynReconfConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/panda_gazebo" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/lib/python3/dist-packages/panda_gazebo/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/installspace/panda_gazebo.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/cmake" TYPE FILE FILES "/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/installspace/panda_gazebo-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo/cmake" TYPE FILE FILES
    "/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/installspace/panda_gazeboConfig.cmake"
    "/home/brl/object_picker/build/rosdeps/panda_gazebo/panda_gazebo/catkin_generated/installspace/panda_gazeboConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/panda_gazebo" TYPE FILE FILES "/home/brl/object_picker/src/rosdeps/panda_gazebo/panda_gazebo/package.xml")
endif()

