#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -a'

# PS1='\u \W : '
# PS1='[\u@\h \W]\$ '
PS1='[ \W ] : '

# Bindings
bind -x '"\C-n": $TERM --working-directory . &'

# Don't push to history if command starts with space
export HISTIGNORE=' *'

alias shit='git'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias rose='~/Projects/C/rose/build/rose'

export VISUAL=nvim;
export EDITOR=nvim;
