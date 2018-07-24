#!/bin/bash
# user: pi
sudo apt update -y
sudo apt install dnsmasq hostapd -y
sudo cp ../templates/dhcp/dhcpcd.conf /etc/dhcpcd.conf
sudo cp ../templates/dhcp/dnsmasq.conf /etc/dnsmasq.conf
sudo cp ../templates/dhcp/hostapd.conf /etc/hostapd/hostapd.conf
sudo cp ../templates/dhcp/hostapd /etc/default/hostapd
sudo cp ../templates/dhcp/sysctl.conf /etc/default/sysctl.conf
sudo cp ../templates/dhcp/rc.local /etc/rc.local
sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo systemctl restart dhcpcd
sudo systemctl restart hostapd
sudo systemctl restart dnsmasq

