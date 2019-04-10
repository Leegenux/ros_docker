#!/bin/bash

XAUTH=/tmp/.docker.xauth &&
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge - &&

docker run -it --rm \
-e DISPLAY=$DISPLAY \
-e XAUTHORITY=$XAUTH \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /tmp/.docker.xauth:/tmp/.docker.xauth \
myros
