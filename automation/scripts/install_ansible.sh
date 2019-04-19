#!/bin/bash
# user: pi
echo Installing dependencies ...
sudo apt install python3-pip -y
sudo useradd -m -p $ANSIBLE_PASSWORD -s /bin/bash ansible
su ansible
pip3 install ansible --user
echo Done
