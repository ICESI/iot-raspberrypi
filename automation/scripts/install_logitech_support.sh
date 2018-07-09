#!/bin/bash
# user: pi
echo Installing dependencies ...
sudo apt-get install uvcdynctrl guvcview -y
echo Performing configurations ...
sudo uvcdynctrl --import=/usr/share/uvcdynctrl/data/046d/logitech.xml
sudo cp ../templates/crontab_root /var/spool/cron/crontabs/root
sudo uvcdynctrl -d video0 -c
echo Done
