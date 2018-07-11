#!/bin/bash
# user: pi

echo "Login as homeassistant user"
su homeassistant

echo "Instaling dependencies..."
pip3 install sqlalchemy --user

echo "Installing homeassistant..."
pip3 install homeassistant --user 

exit
echo "Login as pi user"

echo "Installing vlc..."
sudo apt install vlc -y

echo "Setup homeassistant configurations..."
sudo usermod -a -G audio homeassistant
sudo -u homeassistant mkdir -p /home/homeassistant/.homeassistant
sudo cp ../templates/configuration.yaml /home/homeassistant/.homeassistant/
sudo cp ../templates/home-assistant@homeassistant.service /etc/systemd/system/
sudo cp -R ../templates/script /home/homeassistant/.homeassistant/
sudo touch /home/homeassistant/.homeassistant/groups.yaml
sudo mkdir -p /home/homeassistant/songs
sudo chown -R homeassistant:homeassistant /home/homeassistant

echo "Starting homeassistant service..."
sudo systemctl --system daemon-reload
sudo systemctl enable home-assistant@homeassistant
sudo systemctl start home-assistant@homeassistant
sudo systemctl restart home-assistant@homeassistant
sudo systemctl status home-assistant@homeassistant
