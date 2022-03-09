#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
		prompt_color="cyan"
	fi

	branch=$(current_branch)
	branch_color="red"

	if [ $branch ]
	then
		if [[ -z $(git status -s) ]]
		then
			branch_color="green"
		fi

		git_prompt=" %F{$prompt_color}[%F{$branch_color} $branch* %F{$prompt_color}] "
	else
		git_prompt=' '
	fi

	PROMPT="%F{$prompt_color}$prompt_user [ %F{256}%1~ %F{$prompt_color}]$git_prompt%F{256}: "
}


alias ls='ls --color=auto -a'
alias v='nvim .'
alias nav='. ~/.bin/scripts/nav.sh'
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
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=240'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=240'

