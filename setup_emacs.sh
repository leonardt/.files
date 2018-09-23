curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
ln -s $PWD/emacs.d $HOME/.emacs.d
cd emacs.d && $HOME/.cask/bin/cask install

