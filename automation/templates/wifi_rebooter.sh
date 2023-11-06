#!/bin/bash

# The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
SERVER=8.8.8.8

# Only send two pings, sending output to /dev/null
ping -c2 ${SERVER} > /dev/null

# For the latests version of Raspberry OS
# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
    # Restart the wireless interface
    /usr/sbin/iw wlan0 link
    nmcli dev wifi connect YOUR_SSID
    ifup wlan0
fi

# Old versions of Rasbperry OS
# if [ $? != 0 ]
# then
#     # Restart the wireless interface
#     ifdown --force wlan0
#     ifup wlan0
# fi
