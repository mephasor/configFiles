# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

ZSH_THEME="strug"
USE_POWERLIN="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

export PATH=$HOME/bin:/usr/local/bin:/usr/local/texlive/2021/bin/x86_64-linux:$PATH

#alias ll='ls -hl'
#alias la='ls -ahl'

if command -v batcat &> /dev/null
then
    alias cat=batcat
fi

if command -v exa &> /dev/null
then
    alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
    alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --icons'  # long format
    alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
fi

alias ip="ip -color"

alias printJson="python -m json.tool" 

alias vi='vim'
alias work='cd /home/kons/Wentech/docker/db_admin/'

#alias ll='ls -hl'
#alias la='ls -ahl'
#alias vi='vim'
alias work='cd /home/kons/Wentech/docker/db_admin/ && tmux'

alias devSSH='ssh kons@dev.anessa.com'
alias qaSSH='ssh kons@qa.anessa.com'
alias adoQA='ssh kons@adoqa.anessa.com'
alias adaLive='ssh kons@ada.anessa.com'
alias adoLive='ssh kons@ado.anessa.com'
alias demoSSH='ssh kons@demo.anessa.com'
alias adaDemo='ssh kons@adademo.anessa.com'
alias dockerSSH='ssh kons@docker.anessa.com'

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
alias ip="ip -color"

# Replace some more things with better alternatives
alias cat='bat --style header --style rules --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages

alias vi="vim"
alias work='cd /home/kons/Wentech/db_admin'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
