#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -a'

# PS1='\u \W : '
# PS1='[\u@\h \W]\$ '
PS1='[ \W ] : '

alias shit='git'
alias nav='. ~/.bin/scripts/navigator.sh'

export VISUAL=nvim;
export EDITOR=nvim;
