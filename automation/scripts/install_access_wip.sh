#!/bin/bash
# user: pi
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dnsmasq hostapd
sudo cp ../templates/dnsmasq.conf /etc/dnsmasq.conf
sudo cp ../templates/hostapd.conf /etc/hostapd/hostapd.conf
cat ../templates/interfaces | sudo tee -a /etc/network/interfaces > /dev/null
sudo cp ../templates/hostapdstart /usr/local/bin/hostapdstart 
sudo chmod 667 /usr/local/bin/hostapdstart
sudo cp ../templates/rc.local /etc/rc.local 
