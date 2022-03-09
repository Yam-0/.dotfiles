#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Startup
clear
echo ZSH - $(date +'%A %H:%m')

preexec () { echo -ne "\e[0m" }
precmd () { echo -ne '\n' }

# PS1='[ \W ] : '
if [ "$EUID" -ne 0 ]
then
	PROMPT="%F{blue}TAGE [ %F{256}%1~ %F{blue}] %F{256}: "
else
	PROMPT="%F{red}ROOT [ %F{256}%1~ %F{red}] %F{256}: "
fi


alias ls='ls --color=auto -a'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias fuzzy='. ~/.bin/scripts/fuzzy.sh'

export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
export VISUAL=nvim;
export EDITOR=nvim;
export HISTIGNORE=' *' # Don't push to history if command starts with space
