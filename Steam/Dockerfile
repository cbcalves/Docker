FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends apt-transport-https sudo ca-certificates adduser curl gnupg procps && \
	echo "steamuser     ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/steamuser && \
	adduser --disabled-password --gecos steamuser steamuser && \
	adduser steam video && \
	curl -fSL -o /tmp/steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb && \
	dpkg --add-architecture i386 && \
	apt-get update && \ 
	dpkg -i /tmp/steam.deb || apt-get install -y --no-install-recommends -f && \
	apt-get install -y --no-install-recommends libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 && \
	apt-get install -y --no-install-recommends libasound2 libatomic1 libc++1 libglu1-mesa vim && \
	apt-get upgrade -y && \
	apt-get -y autoclean && \
	apt-get -y clean && \
	rm /tmp/steam.deb

WORKDIR /home/steamuser

VOLUME ["/tmp/.X11-unix"]

USER steamuser
ENV USER steamuser
ENV HOME /home/steamuser

CMD ["/bin/bash"]
