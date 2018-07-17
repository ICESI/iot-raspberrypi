#!/bin/bash
# user: pi

echo "Enabling raspicam driver on video0"
sudo rpi-update
sudo modprobe bcm2835-v4l2
sudo echo 'bcm2835-v4l2' >> /etc/modules
echo "Installing motion..."
sudo apt install motion -y
echo "Updating configurations..."
sudo cp ../templates/motion.conf /etc/motion/motion.conf
sudo chmod 644 /etc/motion/motion.conf
sudo cp ../templates/motion /etc/default/motion
sudo chmod 644 /etc/default/motion
sudo usermod -aG motion pi
echo "0 9 * * * root curl http://localhost:8080/0/detection/start -H 'Authorization: Basic cGk6cmFzcGJlcnJ5' > /dev/null" | sudo tee /etc/crontab -a
echo "0 18 * * * root curl http://localhost:8080/0/detection/pause -H 'Authorization: Basic cGk6cmFzcGJlcnJ5' > /dev/null" | sudo tee /etc/crontab -a
echo "Restarting service..."
sudo systemctl enable motion
sudo systemctl restart motion
