#!/bin/zsh
IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)
sudo docker run -it --rm --env="DISPLAY" -e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX --net=host --device=/dev/dri:/dev/dri --name=ubuntu-foxy ubuntu:foxy
