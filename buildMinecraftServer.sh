#!/bin/bash

# Set the Minecraft Jar URL if not otherwise set
: ${MINECRAFT_JAR_URL:=1.8.8/minecraft_server.1.8.8.jar}

mkdir minecraft-server
cd minecraft-server
wget https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_JAR_URL

echo "eula=true" > eula.txt
