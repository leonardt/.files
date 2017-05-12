#!/bin/bash

# Python
sudo apt-get install python-dev python-pip python3-dev python3-pip

# YouCompleteMe
sudo apt-get install build-essential cmake

# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo pip install neovim
sudo pip3 install neovim

# Setup neovim as editor
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
