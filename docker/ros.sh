#!/bin/zsh
IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)
distro_name=$1
nvidia=$2

if [ $nvidia -eq 1 ];then
	container_name="ros-$distro_name-nvidia"
else
	echo "$(tput setaf 6)Defaulting to ros-$distro_name"
	container_name="ros-$distro_name"
fi

if [ "$(sudo docker ps -a --quiet --filter status=running --filter name=$container_name)" ]; then
	echo "$(tput setaf 6)--------Attaching into $container_name--------$(tput sgr0)"
    sudo docker exec -i -t $container_name /bin/bash
    exit 0
fi

start_docker(){

	local name=$1
	docker_args+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
	docker_args+=("-e NVIDIA_VISIBLE_DEVICES=all")
	sudo docker run -it --privileged --rm \
				--gpus all \
				--net=host \
				--env="DISPLAY"\
				-e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX \
				"${docker_args[@]}" \
				-v ~/Documents/docker_storage/$container_name:/home \
				--device=/dev/dri:/dev/dri \
				--name="$container_name" ros:"$name"
}

docker_args=()
if [ "$nvidia" -eq 1 ];then

	start_docker "$distro_name-nvidia"

else
	start_docker "$distro_name"

fi
