FROM centos:latest

RUN yum update -y && yum install -y wget git tmux vim sudo
RUN su -c "yum install -y java-1.8.0-openjdk"

# Expose minecraft port
EXPOSE 25565

# VOLUME /minecraft
ADD . /minecraft
WORKDIR /minecraft
RUN ./buildMinecraftServer.sh

RUN mkdir ./minecraft-server/world
VOLUME /minecraft/minecraft-server-world

CMD echo starting minecraft server... && ./runMinecraftServer.sh
