# Install script for directory: /home/brl/object_picker/src/brl_pxh_api

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
  include("/home/brl/object_picker/build/brl_pxh_api/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/action" TYPE FILE FILES
    "/home/brl/object_picker/src/brl_pxh_api/action/CartTraj.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/ConstPose.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/EePoseComp.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/GripperMotion.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/GripperPressure.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/JointGroupRads.action"
    "/home/brl/object_picker/src/brl_pxh_api/action/JointRad.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/CartTrajFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/ConstPoseFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/EePoseCompFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperMotionFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/GripperPressureFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointGroupRadsFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/msg" TYPE FILE FILES
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadAction.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadActionGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadActionResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadActionFeedback.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadGoal.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadResult.msg"
    "/home/brl/object_picker/devel/share/brl_pxh_api/msg/JointRadFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/cmake" TYPE FILE FILES "/home/brl/object_picker/build/brl_pxh_api/catkin_generated/installspace/brl_pxh_api-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/include/brl_pxh_api")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/roseus/ros/brl_pxh_api")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/common-lisp/ros/brl_pxh_api")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/share/gennodejs/ros/brl_pxh_api")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/brl/object_picker/devel/lib/python3/dist-packages/brl_pxh_api")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/lib/python3/dist-packages/brl_pxh_api" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/brl/object_picker/devel/lib/python3/dist-packages/brl_pxh_api" FILES_MATCHING REGEX "/home/brl/object_picker/devel/lib/python3/dist-packages/brl_pxh_api/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/brl/object_picker/build/brl_pxh_api/catkin_generated/installspace/brl_pxh_api.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/cmake" TYPE FILE FILES "/home/brl/object_picker/build/brl_pxh_api/catkin_generated/installspace/brl_pxh_api-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api/cmake" TYPE FILE FILES
    "/home/brl/object_picker/build/brl_pxh_api/catkin_generated/installspace/brl_pxh_apiConfig.cmake"
    "/home/brl/object_picker/build/brl_pxh_api/catkin_generated/installspace/brl_pxh_apiConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/brl_pxh_api" TYPE FILE FILES "/home/brl/object_picker/src/brl_pxh_api/package.xml")
endif()

