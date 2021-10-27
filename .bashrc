#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias shit='git'
alias dcon='cd ~/Projects/.dotfiles'
alias lcon='cd ~/.config'

export VISUAL=nvim;
export EDITOR=nvim;
