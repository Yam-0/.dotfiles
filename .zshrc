#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.m.yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Startup
clear
date +'%A %H:%m'

preexec () { echo -ne "\e[0m" }

[ ${ZSH_VERSION} ] && precmd() { prompt; }
[ ${BASH_VERSION} ] && PROMPT_COMMAND=prompt

prompt()
{
	echo -ne '\n'

	prompt_color="red"
	prompt_user="ROOT"
	if [ "$EUID" -ne 0 ]
	then
		prompt_user="TAGE"
		prompt_color="blue"
	fi

	branch=$(current_branch)
	branch_color="red"

	if [ $branch ]
	then
		if [[ -z $(git status -s) ]]
		then
			branch_color="green"
		fi
		git_prompt="%F{$prompt_color}on %F{$branch_color}$branch* "
	else
		git_prompt=''
	fi

	# PROMPT="%F{$prompt_color}$prompt_user [ %F{256}%1~ $git_prompt%F{$prompt_color}] %F{256}: "
	PROMPT="%F{$prompt_color}[ %F{256}%1~ $git_prompt%F{$prompt_color}] %F{256}: "
}


alias ls='ls --color=auto -a'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
alias re='~/Projects/C/r/r'
alias fuzzy='. ~/.bin/scripts/fuzzy.sh'
alias resource='. $HOME/.zshrc'

export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
export VISUAL=nvim;
export EDITOR=nvim;
export HISTIGNORE=' *' # Don't push to history if command starts with space

source /home/tage/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=240'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=240'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=240'
ZSH_HIGHLIGHT_STYLES[path]='fg=256'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=240'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=256'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=240'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=256'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=256'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=256'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=256'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=240'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=240'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[assign]='fg=red'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=green'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=256'
ZSH_HIGHLIGHT_STYLES[default]='fg=256'
