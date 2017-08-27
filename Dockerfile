FROM ubuntu:16.04

MAINTAINER xcpep, http://github.com/xcpep

RUN apt update && \
    apt upgrade -y && \
    apt install -y lib32gcc1 lib32stdc++6 unzip curl && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./server.cfg /server-data/server.cfg

CMD ["/bin/bash", "/entrypoint.sh"]
