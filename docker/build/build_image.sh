#!/bin/zsh

distro_name=$1

echo "Building ros$distro_name using Dockerfile.ros2_$distro_name"
echo "source /opt/ros/$distro_name/setup.bash" >> bash_lines.txt

# Check if directory exists
if [ -d ~/Documents/docker_storage/ros_$distro_name ]  
then
	echo "Folder exists"
else
	mkdir -p ~/Documents/docker_storage/ros_$distro_name/ros2_ws/src/
fi

sudo docker build -t ros:$distro_name -f Dockerfile.ros2_$distro_name .

head -n -1 bash_lines.txt > temp.txt ; mv temp.txt bash_lines.txt


