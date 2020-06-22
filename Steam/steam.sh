#!/bin/bash
docker run -it --name=steam_mine \
    -v /dev/dri:/dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/shm:/dev/shm \
    -v /var/lib/dbus:/var/lib/dbus \
    -v /etc/machine-id:/etc/machine-id \
    -v ${HOME}/Downloads:/tmp/Downloads \
    -v /run/user/${UID}/pulse:/run/user/${UID}/pulse \
    -v $HOME/Documents/Steam:/home/steamuser/ \
    --device /dev/snd \
    --privileged=true \
    -e DISPLAY=${DISPLAY} local/steam
