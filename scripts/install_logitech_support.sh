#!/bin/bash
# user: pi
sudo apt-get install uvcdynctrl
sudo apt-get install guvcview
cat > /var/spool/cron/crontabs/root <<EOF
@reboot uvcdynctrl -s 'LED1 mode' -- off
@reboot echo 0 > /sys/class/leds/led0/brightness
@reboot echo 0 > /sys/class/leds/led1/brightness
EOF
