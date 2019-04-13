#!/bin/bash
# user: pi
# source: https://www.colinodell.com/blog/201812/how-install-php-73
sudo apt-get install -y apt-transport-https lsb-release ca-certificates wget
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update -y
sudo apt-get install -y php7.3
sudo apt-get install -y php7.3-cli php7.3-fpm php7.3-bcmath php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-sqlite3 php7.3-xml php7.3-zip php7.3-xml
sudo a2enmod php7.3
systemctl restart apache2
