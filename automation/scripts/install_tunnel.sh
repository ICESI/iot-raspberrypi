#!/bin/bash
sudo apt install autossh -y
cp ../templates/tunnel.service /etc/systemd/system/tunnel.service
cp ../templates/ngrok.yml /root/.ngrok2/ngrok.yml
cp ../templates/ngrok.yml /home/pi/.ngrok2/ngrok.yml
systemctl daemon-reload
systemctl start tunnel.service
systemctl enable tunnel.service
