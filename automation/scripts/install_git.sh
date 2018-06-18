#!/bin/bash
# user: pi
echo Installing dependencies ...
sudo apt-get install gcc libncurses5-dev libncursesw5-dev -y
echo Installing git ...
sudo apt install git -y
echo Installing tig ...
rm -rf /tmp/tig
git clone https://github.com/jonas/tig.git /tmp/tig
cd /tmp/tig
make 
sudo make install
sudo cp /root/bin/tig /usr/bin/tig
cd -
rm -fr /tmp/tig
echo Done
