#!/bin/bash

# Before the execution, there should be a docker image named "myros".
# First build the image using command:
# `docker build -t myros .` under current directory.
XAUTH=/tmp/.docker.xauth &&
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge - &&
docker run -it --rm \
-e DISPLAY=$DISPLAY \
-e XAUTHORITY=$XAUTH \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /tmp/.docker.xauth:/tmp/.docker.xauth \
myros


