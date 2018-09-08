#! /bin/bash

# To include this startup script for a given instance:
# gcloud beta compute instances create mc-server \
# 	--machine-type=n1-standard-1 \
# 	--boot-disk-size=10GB --boot-disk-type=pd-standard \
# 	--metadata-from-file startup-script=gcloud/startup-script.sh
#
# per the article here: https://cloud.google.com/compute/docs/startupscript#startupscriptlocalfile

cd /home/mitch/minecraft-server
sudo -u mitch tmux new-session -d -s "mc-server" ./runMinecraftServer.sh
