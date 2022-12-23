#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto -a'

reset

# Don't push to history if command starts with space
export HISTIGNORE=' *'

alias shit='git'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias fuzzy='. ~/.bin/scripts/fuzzy.sh'

export VISUAL=nvim;
export EDITOR=nvim;
