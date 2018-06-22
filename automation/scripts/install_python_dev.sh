#!/bin/bash
# user: pi
pip3 install virtualenvwrapper --user
cat <<EOT >> ~/.zshrc
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh
EOT
source ~/.zshrc
