#!/bin/sh
# Install samba
# https://pimylifeup.com/raspberry-pi-samba/

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install samba samba-common-bin

sudo tee -a /etc/samba/smb.conf > /dev/null <<EOT
[pi] # This is the name of the domain
path = /home/pi
writeable=Yes
create mask=0777
directory mask=0777
public=no
EOT

pass=12345
(echo "$pass"; echo "$pass") | sudo smbpasswd -s -a pi

sudo systemctl restart smbd
