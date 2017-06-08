fpath=( "$HOME/.files/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

export PATH=$HOME/miniconda3/bin:$PATH

# Note: according to docs, should be at the end of zshrc
source $HOME/.files/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
