FROM centos:latest

RUN yum update -y && yum install -y wget git tmux vim sudo
RUN su -c "yum install -y java-1.8.0-openjdk"

# Expose minecraft port
EXPOSE 25565

# VOLUME /minecraft
ADD . /minecraft
WORKDIR /minecraft

ENV MINECRAFT_JAR_URL=1.9.2/minecraft_server.1.9.2.jar

CMD ./buildMinecraftServer.sh && ./runMinecraftServer.sh
