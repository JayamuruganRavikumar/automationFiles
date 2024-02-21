## Links

https://github.com/nicola-farina/robolab

## Process

### inside the docker image

- cd to home
- install xauth
- create .Xauthority file 
- add `xauth add $VARDPY${DISPLAY: -1} $VARPROTO $VARHEX` var to .bashrc
- use xauth list to verify the variables

### Runfile

`#!/bin/zsh`
`IFS=' ' read -r VARDPY VARPROTO VARHEX <<< $(xauth list)`
`sudo docker run -it --rm --env="DISPLAY" -e VARDPY=$VARDPY -e VARPROTO=$VARPROTO -e VARHEX=$VARHEX --net=host --device=/dev/dri:/dev/dri --name=ubuntu-ros ubuntu:ros`
