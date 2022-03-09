#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

clear

# Date
date +'%A %H:%m'

autoload -U colors && colors

preexec () { echo -ne "\e[0m" }

# PS1='[ \W ] : '
if [ "$EUID" -ne 0 ]
then
	PS1=$'\n\e[0;34mTAGE [\e[m %1~ \e[0;34m]\e[m : \e[0;33m'
else
	PS1=$'\n\e[0;31mROOT [\e[m %1~ \e[0;31m]\e[m : \e[0;33m'
fi

# Don't push to history if command starts with space
export HISTIGNORE=' *'

alias ls='ls --color=auto -a'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias fuzzy='. ~/.bin/scripts/fuzzy.sh'

export VISUAL=nvim;
export EDITOR=nvim;
