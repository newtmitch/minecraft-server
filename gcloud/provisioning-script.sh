#! /bin/bash

# NOTE: this script requires user input for the noip configuration. As such, if you want
# to use this as a startup script, be sure to comment the last portion out in order to allow
# it to run unattended.

sudo apt-get update
sudo apt-get install -y tmux wget curl git gcc htop

# install docker per https://docs.docker.com/v17.12/install/linux/docker-ce/debian/#install-docker-ce-1
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce

# Add docker capabilities for current user (requires logout/login)
# per https://docs.docker.com/v17.12/install/linux/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER

# pull and set up the minecraft docker image
sudo gcloud auth configure-docker --quiet
sudo docker run -dti \
  --name=minecraft-server \
  -v $(pwd)/world:/minecraft/minecraft-server/world \
  -p 25565:25565 \
  --restart=unless-stopped \
  gcr.io/mitch-minecraft/minecraft

# install noip - note that this is not an automated task due to needing credentials
cd /usr/local/src
sudo wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
sudo tar xzf noip-duc-linux.tar.gz
sudo rm noip-duc-linux.tar.gz
cd noip-2.1.9-1
sudo make
sudo cp debian.noip2.sh /etc/init.d/noip2.sh
sudo make install
sudo /usr/local/bin/noip2
