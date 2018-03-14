#!/bin/bash

git submodule init
git submodule update

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/zshrc $HOME/.zshrc
