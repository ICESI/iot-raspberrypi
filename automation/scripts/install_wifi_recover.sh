#!/bin/bash
# user: pi
# hardware: raspberry pi zero w
# source: http://blog.andypotts.com/2017/10/raspberry-pi-zero-loses-connection-to.html
echo "Copying script into binaries directory..."
sudo cp ../templates/wifi_rebooter.sh /usr/local/bin/
echo "Setting permissions on script..."
sudo chmod +x /usr/local/bin/wifi_rebooter.sh
echo "Configuring crontab job.."
echo "*/5 * * * * root /usr/local/bin/wifi_rebooter.sh" | sudo tee /etc/crontab -a
echo "Done"
