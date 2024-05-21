#!/bin/zsh
IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)
container_name="ros-$1"

if [ "$(sudo docker ps -a --quiet --filter status=running --filter name=$container_name)" ]; then
	echo "Attaching into $container_name"
    sudo docker exec -i -t $container_name /bin/bash
    exit 0
fi

docker_args+=("-v ~/Documents/docker_storage/ros_$1:/home")
sudo docker run -it --privileged --rm \
			--net=host \
			--env="DISPLAY"\
			-e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX \
			-v ~/Documents/docker_storage/ros_foxy:/home \
			--device=/dev/dri:/dev/dri \
			--name="$container_name" ros:foxy

