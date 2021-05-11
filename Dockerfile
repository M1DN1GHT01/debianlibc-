# ----------------------------------
# Environment: Redis Database
# ForestRacks.com | NoahServer.online
# ----------------------------------
FROM    redis:6-buster

LABEL   author="Noah Smith" maintainer="noah@noahserver.online"

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt -y update && \
        apt -y upgrade && \
        apt -y install iproute2 && \
        useradd -d /home/container -m container -s /bin/bash

USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
