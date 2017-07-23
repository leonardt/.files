#!/bin/bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip install neovim
mkdir -p $HOME/.config/nvim
ln -s `pwd`/init.vim $HOME/.config/nvim/init.vim
ln -s `pwd`/zshrc $HOME/.zshrc
