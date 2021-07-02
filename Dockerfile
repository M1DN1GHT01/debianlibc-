# ----------------------------------
# Environment: Debian, Mono
# Main Mono Docker Format
# ----------------------------------
FROM    lawnenforcer/main:latest
FROM    mono:5

LABEL   author="Noah Smith" maintainer="noah@noahserver.online"

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt update -y \
        && apt upgrade -y \
        && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
        && dpkg -i packages-microsoft-prod.deb \
        && apt update -y \
        && apt upgrade -y \
        && apt install -y dotnet-sdk-5.0 aspnetcore-runtime-5.0 libgdiplus iproute2 unzip curl


USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
