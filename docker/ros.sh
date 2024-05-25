#!/bin/zsh
IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)
distro_name=$1
container_name="ros-$distro_name"

if [ "$(sudo docker ps -a --quiet --filter status=running --filter name=$container_name)" ]; then
	echo "Attaching into $container_name"
    sudo docker exec -i -t $container_name /bin/bash
    exit 0
fi

docker_args+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
docker_args+=("-e NVIDIA_VISIBLE_DEVICES=all")
#docker_args+=("-v ~/Documents/docker_storage/$container_name:/home")

sudo docker run -it --privileged --rm \
			--gpus all \
			--net=host \
			--env="DISPLAY"\
			-e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX \
			${docker_args[@]} \
			-v ~/Documents/docker_storage/$container_name:/home \
			--device=/dev/dri:/dev/dri \
			--name="$container_name" ros:$distro_name

