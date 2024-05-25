#!/bin/zsh

distro_name=$1
nvidia=$2

if [ $nvidia = 1 ]
then
	echo "Building ros$distro_name using Dockerfile.ros2_$distro_name.nvidia"
else
	echo "Building ros$distro_name using Dockerfile.ros2_$distro_name"
fi

echo "source /opt/ros/$distro_name/setup.bash" >> bash_lines.txt

# Check if directory exists
if [ -d ~/Documents/docker_storage/ros_$distro_name ]  
then
	echo "Folder exists"
else
	mkdir -p ~/Documents/docker_storage/ros-$distro_name/ros2_ws/src/
fi

if [ $nvidia = 1 ]
then
	sudo docker build -t ros:$distro_name-nvidia -f Dockerfile.ros2_$distro_name.nvidia .
else
	sudo docker build -t ros:$distro_name -f Dockerfile.ros2_$distro_name .
fi

head -n -1 bash_lines.txt > temp.txt ; mv temp.txt bash_lines.txt
