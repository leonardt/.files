#!/bin/bash

git submodule init
git submodule update

sudo apt-get install zsh

sudo apt-get install software-properties-common

# stable only works for xenial, use unstable since many boxes still use trusty
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "Change the shell to zsh"
chsh

# wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
# bash Miniconda3-latest-MacOSX-x86_64.sh
# rm Miniconda3-latest-MacOSX-x86_64.sh
# export PATH="$HOME/miniconda3/bin:$PATH"

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

