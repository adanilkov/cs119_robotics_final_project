execute_process(COMMAND "/home/brl/object_picker/build/ros-gazebo-gym/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/brl/object_picker/build/ros-gazebo-gym/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
