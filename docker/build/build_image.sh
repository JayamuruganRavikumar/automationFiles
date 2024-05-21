#!/bin/zsh

distro_name=$1

echo $distro_name

if [ -d ~/Documents/docker_storage/ros_$distro_name ]  # Check if directory exists
then
	echo "Folder exists"
else
	mkdir ~/Documents/docker_storage/ros_$distro_name
fi

sudo docker build -t ros:$distro_name -f Dockerfile.ros2_$distro_name .


