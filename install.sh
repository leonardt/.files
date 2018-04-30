#!/bin/bash
git submodule init
git submodule update

mkdir -p $HOME/.tmux/plugins
ln -s `pwd`/tpm $HOME/.tmux/plugins/tpm
ln -s `pwd`/arcticicestudio/nord-dircolors/src/dir_colors $HOME/.dir_colors

brew install wget
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
export PATH="$HOME/miniconda3/bin:$PATH"

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install neovim
pip install neovim
pip install python-language-server
mkdir -p $HOME/.config/nvim
ln -s `pwd`/init.vim $HOME/.config/nvim/init.vim

# Setup vim too (sometimes I use macvim?)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s `pwd`/.vimrc $HOME/.vimrc

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
ln -s `pwd`/gitconfig $HOME/.gitconfig
ln -s `pwd`/tmux.conf $HOME/.tmux.conf
ln -s `pwd`/tmux-osx.conf $HOME/.tmux-osx.conf
mkdir -p $HOME/.config/alacritty
ln -s `pwd`/alacritty.yml $HOME/.config/alacritty/alacritty.yml

ln -s `pwd`/chunkwmrc $HOME/.chunkwmrc
ln -s `pwd`/skhdrc $HOME/.skhdrc
