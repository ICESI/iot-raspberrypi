#!/bin/bash
# user: pi
echo "Installing vim..."
sudo apt install vim -y
echo "Updating configurations..."
cp ../templates/vimrc ~/.vimrc
echo "Installing plugins..."
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
