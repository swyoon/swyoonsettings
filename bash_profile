export PATH=$PATH:/Users/sangwoong/Documents/phantomjs-2.1.1-macosx/bin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias ll="ls -al"

#sudo pfctl -f /etc/pf.conf
#sudo pfctl -e
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

function prompt {
	local BLACK="\[\033[0;30m\]"
		local BLACKBOLD="\[\033[1;30m\]"
		local RED="\[\033[0;31m\]"
		local REDBOLD="\[\033[1;31m\]"
		local GREEN="\[\033[0;32m\]"
		local GREENBOLD="\[\033[1;32m\]"
		local YELLOW="\[\033[0;33m\]"
		local YELLOWBOLD="\[\033[1;33m\]"
		local BLUE="\[\033[0;34m\]"
		local BLUEBOLD="\[\033[1;34m\]"
		local PURPLE="\[\033[0;35m\]"
		local PURPLEBOLD="\[\033[1;35m\]"
		local CYAN="\[\033[0;36m\]"
		local CYANBOLD="\[\033[1;36m\]"
		local WHITE="\[\033[0;37m\]"
		local WHITEBOLD="\[\033[1;37m\]"

		PS1="$BLUE[\u]$RED\w\[\033[m\]$PURPLE\$(__git_ps1)$WHITE\$ "
		export PROMPT_DIRTRIM=3
}
prompt

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

source ~/.git-completion.bash

export PYTHONENCODING=utf-8

export PATH="/Library/PostgreSQL/9.5/bin/:$PATH"
