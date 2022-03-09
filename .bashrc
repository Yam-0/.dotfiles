#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto -a'

reset

# Date
date +'%A %H:%m'

# PS1='[ \W ] : '
if [ "$EUID" -ne 0 ]
then
	PS1='\n\e[0;34mTAGE [\e[m \W \e[0;34m]\e[m : '
else
	PS1='\n\e[0;31mROOT [\e[m \W \e[0;31m]\e[m : '
fi

# Bindings
bind -x '"\C-n": $TERM --working-directory . &'

# Don't push to history if command starts with space
export HISTIGNORE=' *'

alias shit='git'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias fuzzy='. ~/.bin/scripts/fuzzy.sh'

export VISUAL=nvim;
export EDITOR=nvim;
