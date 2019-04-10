FROM ros:kinetic-robot 

RUN apt update && apt install -y sudo tmux vim fish

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
RUN echo "set-option -g default-shell /usr/local/bin/fish" >> /etc/tmux.conf

USER developer
ENV HOME /home/developer

## Reference
# https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-docker-container


