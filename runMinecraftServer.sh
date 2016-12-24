#!/bin/bash

# Set the default directory if no parameter given
MCDIR=${1:-minecraft}

cd $MCDIR
java -Xmx1024M -Xms1024M -jar minecraft_server.jar
