#!/bin/bash
# user: pi
sudo apt update
sudo apt upgrade
sudo apt install dnsmasq hostapd
sudo cp ../templates/access/dnsmasq.conf /etc/dnsmasq.conf
sudo cp ../templates/access/hostapd.conf /etc/hostapd/hostapd.conf
# WIP: Check the content of /etc/network/interfaces file
cat ../templates/access/interfaces | sudo tee -a /etc/network/interfaces > /dev/null
sudo cp ../templates/access/hostapdstart /usr/local/bin/hostapdstart 
sudo chmod 667 /usr/local/bin/hostapdstart
sudo cp ../templates/access/rc.local /etc/rc.local 
