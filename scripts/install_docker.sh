#!/bin/bash
# reference: https://docs.docker.com/install/linux/docker-ce/debian/
# user: pi
sudo apt-get update -y
sudo apt install python3-pip -y
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install docker-ce -y
sudo pip3 install docker-compose
sudo usermod -aG docker pi
su pi
newgrp docker
docker pull hypriot/rpi-python
docker pull hypriot/rpi-traefik
