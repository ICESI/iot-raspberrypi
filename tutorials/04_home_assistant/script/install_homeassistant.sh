#!/bin/bash
# user: pi

echo "Installing vlc..."
sudo apt install vlc -y

echo "Instaling dependencies..."
sudo -u homeassistant pip3 install sqlalchemy --user

echo "Installing homeassistant..."
sudo -u homeassistant pip3 install homeassistant --user 

#echo "Checking for systemd..."
# ps -p 1 -o comm=

echo "Setup homeassistant configurations..."
sudo usermod -a -G audio homeassistant
sudo -u homeassistant mkdir -p /home/homeassistant/.homeassistant
sudo cp ../templates/configuration.yaml /home/homeassistant/.homeassistant/
sudo cp ../templates/home-assistant@homeassistant.service /etc/systemd/system/
sudo cp -R ../templates/script /home/homeassistant/.homeassistant/
sudo mkdir -p /home/homeassistant/songs
sudo chown -R homeassistant:homeassistant /home/homeassistant

echo "Starting homeassistant service..."
sudo systemctl --system daemon-reload
sudo systemctl enable home-assistant@homeassistant
sudo systemctl start home-assistant@homeassistant
sudo systemctl restart home-assistant@homeassistant
sudo systemctl status home-assistant@homeassistant
