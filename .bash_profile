#
# ~/.bash_profile
#

if [ 'uname -s' == "linux" ] && [ -z "${WAYLAND_DISPLAY}" ] && [ ${XDG_VTNR} -eq 1 ]; then
  exec sway
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:/home/michael/.local/bin/
export LC_ALL=en_US.UTF-8

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -f ~/RC_files/.git-completion.bash ]; then
  . ~/RC_files/.git-completion.bash
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
