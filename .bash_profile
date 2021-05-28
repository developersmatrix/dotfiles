#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx --vt1

# if [[ "$(tty)" = "/dev/tty" ]]; then
# 	pgrep awesome || startx
# fi

