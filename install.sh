#!/bin/bash
git submodule init
git submodule update

brew install wget
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
export PATH="$HOME/miniconda3/bin:$PATH"

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install neovim
pip install neovim
mkdir -p $HOME/.config/nvim
ln -s `pwd`/init.vim $HOME/.config/nvim/init.vim

brew install zsh
ln -s `pwd`/zshrc $HOME/.zshrc

# brew install glfw  # for kitty terminal
# ln -s `pwd`/kitty.conf $HOME/Library/Preferences/kitty/kitty.conf
# 
# ln -s `pwd`/skhdrc $HOME/.skhdrc
# brew install koekeishiya/formulae/skhd
# brew services start skhd

pip install virtualenvwrapper
export WORKON_HOME=~/.virtual_envs
mkdir -p $WORKON_HOME

ln -s `pwd`/latexmkrc $HOME/.latexmkrc
