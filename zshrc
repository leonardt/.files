fpath=( "$HOME/.files/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit; compinit

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/2017/bin/x86_64-darwin/:$PATH
export PATH=$HOME/miniconda3/bin:$PATH

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export WORKON_HOME=$HOME/.envs
# mkdir -p $WORKON_HOME
# source virtualenvwrapper.sh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

alias gp=git pull
alias gc=git commit
alias gP=git push

clean_pycache () {
    find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
}

# added by travis gem
[ -f /Users/lenny/.travis/travis.sh ] && source /Users/lenny/.travis/travis.sh

export WORKON_HOME=~/.virtual_envs
source $HOME/miniconda3/bin/virtualenvwrapper.sh

# Note: according to docs, should be at the end of zshrc
source $HOME/.files/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export DYLD_LIBRARY_PATH=$HOME/miniconda3/lib:$DYLD_LIBRARY_PATH
export PYTHON_CONFIG=python3-config
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

pygmentize_clipboard() {
    pbpaste | pygmentize -O "style=paraiso-dark,fontface=Source Code Pro,fontsize=76" -f rtf -l c | pbcopy
}
