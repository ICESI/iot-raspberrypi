#!/bin/bash
# user: pi
echo "Installing vim..."
sudo apt install vim -y
echo "Installing python support..."
sudo apt-get install vim-nox -y
# sudo apt-get install vim-nox-py2 -y
echo "Updating configurations..."
cp ../templates/vimrc_bundle ~/.vimrc
echo "Installing plugins..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Showing supported languages..."
vim --version
