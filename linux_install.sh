#!/bin/bash

git submodule init
git submodule update

wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
export PATH="$HOME/miniconda3/bin:$PATH"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip install neovim
mkdir -p $HOME/.config/nvim
ln -s `pwd`/init.vim $HOME/.config/nvim/init.vim

ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/zshrc $HOME/.zshrc

pip install virtualenvwrapper
export WORKON_HOME=~/.virtual_envs
mkdir -p $WORKON_HOME
ln -s `pwd`/gitconfig $HOME/.gitconfig
ln -s `pwd`/tmux.conf $HOME/.tmux.conf
