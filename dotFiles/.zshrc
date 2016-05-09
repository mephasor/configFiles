# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

ZSH_THEME="strug"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

alias ll='ls -hl'
alias la='ls -ahl'

alias pip3.5='python3.5 -m pip'

alias sgmc='ssh p652d@192.168.1.10'
