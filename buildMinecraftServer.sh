#!/bin/bash

mkdir minecraft-server
cd minecraft-server
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.8/minecraft_server.1.8.8.jar

echo "eula=true" > eula.txt
