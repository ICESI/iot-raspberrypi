#!/usr/bin/env bash
echo Installing dependencies ...
sudo apt-get update && sudo apt-get install -y git automake build-essential pkg-config libevent-dev libncurses5-dev
echo Installing tmux ...
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
git checkout 2.7
sh autogen.sh
./configure && make
sudo make install
sudo ln -s /usr/local/bin/tmux /usr/bin/tmux
cd -
rm -fr /tmp/tmux
echo Updating tmux configurations ...
cp ../templates/tmux.conf ~/.tmux.conf
echo Done
