#!/bin/sh

PACKAGES="ros-kinetic-desktop-full python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools build-essential ros-kinetic-jsk-tools"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES

sudo rosdep init
rosdep update
