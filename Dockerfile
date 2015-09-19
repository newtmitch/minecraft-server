FROM centos:latest

RUN yum update -y && yum install -y wget git tmux vim sudo
RUN su -c "yum install -y java-1.8.0-openjdk"

# Expose minecraft port
EXPOSE 25565

ADD . /minecraft
WORKDIR /minecraft

CMD ./buildMinecraftServer.sh && ./runMinecraftServer.sh
