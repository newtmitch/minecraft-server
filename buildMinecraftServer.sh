#!/bin/bash

# Set the Minecraft Jar URL if not otherwise set
: ${MINECRAFT_JAR_URL:=1.8.8/minecraft_server.1.8.8.jar}

mkdir minecraft-server

# Copy the ops.json file if it exists
if [ -f server-settings/ops.json ]; then
  cp server-settings/ops.json minecraft-server
fi

# Copy a template file if defined by env var
if [ -n "$MINECRAFT_SERVER_PROPERTIES" ]; then
  cp server-settings/server-properties-templates/$MINECRAFT_SERVER_PROPERTIES.properties minecraft-server/server.properties
fi

cd minecraft-server
wget https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_JAR_URL

echo "eula=true" > eula.txt
