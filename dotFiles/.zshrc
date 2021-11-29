# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

ZSH_THEME="strug"
USE_POWERLIN="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/local/texlive/2021/bin/x86_64-linux:$PATH

alias ll='ls -hl'
alias la='ls -ahl'
alias vi='vim'
alias work='cd /home/kons/Wentech/docker/db_admin/'

alias pip3.5='python3.5 -m pip'

alias devSSH='ssh kons@dev.anessa.com'
alias qaSSH='ssh kons@qa.anessa.com'
alias adoQA='ssh kons@adoqa.anessa.com'
alias adaLive='ssh kons@ada.anessa.com'
alias adoLive='ssh kons@ado.anessa.com'
alias demoSSH='ssh kons@demo.anessa.com'
alias adaDemo='ssh kons@adademo.anessa.com'
alias dockerSSH='ssh kons@docker.anessa.com'
