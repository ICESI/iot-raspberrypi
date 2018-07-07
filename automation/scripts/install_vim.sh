#!/bin/bash
# user: pi
sudo apt install vim -y
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp ../templates/vimrc ~/.vimrc
