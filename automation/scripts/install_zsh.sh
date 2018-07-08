#!/bin/bash
# user: pi
echo Installing zsh ...
sudo apt install zsh -y
export ZSH="$HOME/.dotfiles/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo Updating configurations ...
cp ../templates/zshrc ~/.zshrc
echo 'export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"' >> $ZSH_CUSTOM/custom.zsh
source ~/.zshrc
