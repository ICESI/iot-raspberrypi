#!/bin/bash
# user: pi
echo Installing dependencies ...
sudo apt-get install uvcdynctrl guvcview -y
echo Performing configurations ...
sudo uvcdynctrl --import=/usr/share/uvcdynctrl/data/046d/logitech.xml
echo "@reboot uvcdynctrl -s 'LED1 mode' -- off" | sudo tee /var/spool/cron/crontabs/root
echo "@reboot echo 0 > /sys/class/leds/led0/brightness" | sudo tee /var/spool/cron/crontabs/root -a
echo "@reboot echo 0 > /sys/class/leds/led1/brightness" | sudo tee /var/spool/cron/crontabs/root -a
echo Getting device info...
sudo uvcdynctrl -d video0 -c
echo Done
