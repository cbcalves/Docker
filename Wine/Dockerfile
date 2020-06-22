FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends sudo ca-certificates adduser curl gnupg && \
	echo "wineuser     ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wineuser && \
	adduser --disabled-password --gecos wineuser wineuser && \
    adduser wineuser video && \
	curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" > /etc/apt/sources.list.d/winehq.list && \
	curl -fsSL https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/Release.key | apt-key add - && \
	sudo echo "deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10 ./" > /etc/apt/sources.list.d/libfaudio0.list && \
    sudo echo "deb http://deb.debian.org/debian/ buster non-free contrib" >> /etc/apt/sources.list.d/debnew.list && \
    sudo echo "deb http://security.debian.org/debian-security/ buster/updates contrib non-free" >> /etc/apt/sources.list.d/debnew.list && \
    sudo echo "deb http://deb.debian.org/debian/ buster-updates contrib non-free" >> /etc/apt/sources.list.d/debnew.list && \
	dpkg --add-architecture i386 && \
	apt-get update && \ 
	apt-get install -y --install-recommends winehq-devel winetricks q4wine && \
	apt-get install -y -f && \
	apt-get upgrade -y && \
	apt-get -y autoclean && \
	apt-get -y clean

WORKDIR /home/wineuser

VOLUME ["/tmp/.X11-unix"]

USER wineuser
ENV USER wineuser
ENV HOME /home/wineuser

CMD ["/bin/bash"]
