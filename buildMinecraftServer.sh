#!/bin/bash

# Set the Minecraft Jar URL if not otherwise set
: ${MINECRAFT_VERSION:=1.12}

# Set the default directory if no parameter given
MCDIR=${1:-minecraft-server}

# Make two minecraft server directories - a single server can run multiple servers
mkdir $MCDIR

# Copy the ops.json file if it exists
if [ -f server-settings/ops.json ]; then
  cp server-settings/ops.json $MCDIR
fi

# Copy a template file if defined by env var
if [ -n "$MINECRAFT_SERVER_PROPERTIES" ]; then
  cp server-settings/server-properties-templates/$MINECRAFT_SERVER_PROPERTIES.properties $MCDIR/server.properties
fi

cd $MCDIR

# Remove any existing server jar files
rm -f minecraft_server.jar

#Download the new jar file
wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar

echo "eula=true" > eula.txt
