fpath=( "$HOME/.files/zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

autoload -Uz compinit; compinit

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/2017/bin/x86_64-darwin/:$PATH
export PATH=$HOME/miniconda3/bin:$PATH

export FZF_DEFAULT_COMMAND='rg --files'
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
# source $HOME/miniconda3/bin/virtualenvwrapper.sh

# Note: according to docs, should be at the end of zshrc
source $HOME/.files/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export DYLD_LIBRARY_PATH=$HOME/miniconda3/lib:$DYLD_LIBRARY_PATH
export PYTHON_CONFIG=python3-config
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

pygmentize_clipboard() {
    pbpaste | pygmentize -O "style=bw,fontface=InconsolataGo Nerd Font Mono,fontsize=76" -f rtf -l python | pbcopy
}

# From: https://github.com/junegunn/fzf/wiki/examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

export EDITOR=nvim
alias vim=nvim

case `uname` in
  Darwin)
    alias ls='ls -G'
  ;;
  # Linux)
  #   # commands for Linux go here
  # ;;
esac

# From man zshoptions
# INC_APPEND_HISTORY
#    This  options  works like APPEND_HISTORY except that new history
#    lines are added to the $HISTFILE incrementally (as soon as  they
#    are  entered),  rather  than waiting until the shell exits.  The
#    file will still be periodically re-written to trim it  when  the
#    number  of  lines grows 20% beyond the value specified by $SAVE-
#    HIST (see also the HIST_SAVE_BY_COPY option).
setopt INC_APPEND_HISTORY

addnw () {
    git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -
}

alias gco='git checkout'
