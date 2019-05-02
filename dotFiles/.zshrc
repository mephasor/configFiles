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
alias vi='vim'

alias pip3.5='python3.5 -m pip'


export wsasCertPath=/Wentech/repos/wsas-java-bridge/dist/
alias adoLive='ssh kons@ado.wentechsolutions.com'
alias digSsh='ssh kons@138.197.154.8'
alias anessaLive='ssh kons@anessa.wentechsolutions.com'
alias adoAWSDev='ssh -i ~/Wentech/wentech-comp.pem ec2-user@52.60.154.48'

source /usr/share/nvm/init-nvm.sh
