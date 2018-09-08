#! /bin/bash

sudo apt-get update
sudo apt-get install -y tmux wget curl git gcc htop default-jre
git clone https://github.com/newtmitch/minecraft-server.git
cd minecraft-server
./buildMinecraftServer.sh

# run the minecraft server
tmux new-session -s "mc-server" ./runMinecraftServer.sh