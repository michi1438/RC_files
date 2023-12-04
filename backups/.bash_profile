#
# ~/.bash_profile
#

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi

ip address add 192.168.1.168/24 broadcast + dev enp0s25

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:/home/michael/.local/bin/
export LC_ALL=en_US.UTF-8

[[ -f ~/.bashrc ]] && . ~/.bashrc
