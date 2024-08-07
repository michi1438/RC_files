# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# otherstuff specific to this computer LC_ALL=...

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=500

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)

bind -s 'set completion-ignore-case on'

unset LS_COLORS

parse_git_branch()
{
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
PS1="$prompt_color┌─$info_color(\u@\h)[\A] $prompt_color[\033[0;1m\]\w$prompt_color]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n$prompt_color└$info_color> \[\033[0m\]";
unset prompt_color
unset info_color

[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"

#OSC-7 escape sequence to open new term in the same dir as parent term instance,
osc7_cwd() {
	local strlen=${#PWD}
	local encoded=""
	local pos c o
	for (( pos=0; pos<strlen; pos++ )); do
		c=${PWD:$pos:1}
		case "$c" in
			[-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
			* ) printf -v o '%%%02X' "'${c}" ;;
	     esac
		encoded+="${o}"
	done
	printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
																		

# colored GCC warnings and errors

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -al'


# other aliases
alias vi='vim'

alias SH0='shutdown 0'
alias c='clear'
alias r='reset'

alias scrshot='slurp | grim -g - screenshot.png'

alias sshserver="ssh root@192.168.1.252 -p 22"

alias ardui='arduino-cli'
alias ardui_comp='arduino-cli compile --fqbn arduino:avr:uno'
alias ardui_uplo='arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
