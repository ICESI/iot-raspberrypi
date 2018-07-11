#!/bin/bash
# user: pi
echo "Installing python3-pip"
sudo apt install python3-pip -y
echo "Installing virtualenvwrapper..."
pip3 install virtualenvwrapper --user
cat <<EOT >> ~/.zshrc
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh
EOT
source ~/.zshrc
echo "Installing bpython..."
pip3 install bpython --user
sudo cp /home/pi/.local/bin/bpython /usr/local/bin
