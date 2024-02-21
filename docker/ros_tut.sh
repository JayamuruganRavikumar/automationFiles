#!/bin/zsh
IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)
sudo docker run -it --privileged --rm --env="DISPLAY" -e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX --net=host -v ~/Documents/docker_storage/ros_tut:/home --device=/dev/dri:/dev/dri --name=tut ros_foxy 
