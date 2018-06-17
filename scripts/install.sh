#!/bin/bash
# This script must be executed as root
apt install python3-pip -y
useradd -m -p $ANSIBLE_PASSWORD -s /bin/bash ansible
su ansible
pip install ansible --user
