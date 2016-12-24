# minecraft-server
Some basic tools and stuff to quickly get minecraft running on a linux server

# Overview

This repo is to provide a couple of convenient scripts to get a minecraft server running in
one place or another. This is useful for an AWS instance of Minecraft as well as a local
Docker instance.

# Instructions

## Platform-specific setup

### Docker

Pull down this repo as you'll need it to build your Docker images.

I'm assuming you have Docker installed and running. If not, do that first and get docker-machine started. Then:

    docker build -t mitch/mc .

It'll do some magic on a CentOS instance (instead of Ubuntu as this mimics the Amazon Linux AMI more closely), then
create a container with that image:

    docker run -ti -p 25565:25565 mitch/mc

Or if you want to make some mods before you start it, drop into the bash shell first.

    docker run -ti -p 25565:25565 mitch/mc bash

Or for two servers simultaneously:

    docker run -ti -p 25565:25565 -p 25566:25566 mitch/mc bash

Or how about if you want the server local on your filesystem so you can fiddle with settings without dropping into
the server at all? **NOTE: this will make mods to your local filesystem in the same repo directory as you're sitting now...**

### AWS or other local Linux system

If you're building on AWS, I suggest the t2.small at a minimum. I saw a "server running behind" message the first
time I logged in, but not after that. If you want to not risk that, go with a t2.medium.

If using a local Linux image, you're ready to go.

Now pull down this repo.

Run:

    ./buildMinecraftServer.sh && ./runMinecraftServer.sh

That's it!

### Sync AWS backups to local directory

    rsync -avz --progress -e 'ssh -i ~/.ssh/mykey.pem' ec2-user@superawesomeip:/home/ec2-user/backups-minecraft/* .
