#!/bin/bash
PX4_Autopilot_clone="/home/aicenteruav/PX4-Autopilot"

cd $PX4_Autopilot_clone
# DONT_RUN=1 make px4_sitl_default gazebo
# make px4_sitl_default gazebo
source ~/catkin_ws/devel/setup.bash    # (optional)
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:~/catkin_ws/src/E2ES/gazebo
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/E2ES/gazebo/models
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:~/catkin_ws/devel/lib
echo $GAZEBO_RESOURCE_PATH
echo $GAZEBO_MODEL_PATH
echo $GAZEBO_PLUGIN_PATH
# roslaunch pixhawk_fsm rviz.launch &
# sleep 2
roslaunch pixhawk_fsm px4_stil.launch
