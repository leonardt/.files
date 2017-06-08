fpath=( "$HOME/.files/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit; compinit

export PATH=$HOME/miniconda3/bin:$PATH

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export WORKON_HOME=$HOME/.envs
mkdir -p $WORKON_HOME
source virtualenvwrapper.sh

# Note: according to docs, should be at the end of zshrc
source $HOME/.files/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
