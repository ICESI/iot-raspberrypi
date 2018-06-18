#!/bin/bash
# user: pi
echo Installing dependencies ...
sudo apt-get install uvcdynctrl guvcview -y
echo Performing configurations ...
sudo mv ../templates/crontab_root /var/spool/cron/crontabs/root
echo Done
