FROM ros:kinetic-robot 

# Basic setup
RUN apt update && apt upgrade -y && apt install -y sudo tmux vim fish ros-kinetic-ros-tutorials

# Sound system
RUN apt install -y alsa-utils alsa-firmware-loaders alsa-oss alsa-base # alsa-lib apulse
# RUN amixer sset Master unmute && \
# 	amixer sset Speaker unmute && \
# 	amixer sset Headphone unmute

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
	mkdir -p /etc/sudoers.d && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# Set default shell as "fish"
RUN echo "set-option -g default-shell /usr/bin/fish" >> /etc/tmux.conf

USER developer
ENV HOME /home/developer

## Reference
# https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-docker-container


