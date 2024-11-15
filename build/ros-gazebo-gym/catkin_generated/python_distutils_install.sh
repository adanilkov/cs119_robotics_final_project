#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/brl/object_picker/src/ros-gazebo-gym"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/brl/object_picker/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/brl/object_picker/install/lib/python3/dist-packages:/home/brl/object_picker/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/brl/object_picker/build" \
    "/usr/bin/python3" \
    "/home/brl/object_picker/src/ros-gazebo-gym/setup.py" \
    egg_info --egg-base /home/brl/object_picker/build/ros-gazebo-gym \
    build --build-base "/home/brl/object_picker/build/ros-gazebo-gym" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/brl/object_picker/install" --install-scripts="/home/brl/object_picker/install/bin"
