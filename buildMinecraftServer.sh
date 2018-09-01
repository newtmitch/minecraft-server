#!/bin/bash

# Set the default directory if no parameter given
MCDIR=${1:-minecraft-server}

# Set the server download url if no other url given
: ${MC_DOWNLOAD_URL:=https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar}

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

# Download the new jar file - this is a specific link that might not work more than once,
# and definitely can't be used across versions due to the hashed path (weenies). Go to the
# following link to get the latest URL: https://minecraft.net/en-us/download/server
wget -O minecraft_server.jar $MC_DOWNLOAD_URL

echo "eula=true" > eula.txt
