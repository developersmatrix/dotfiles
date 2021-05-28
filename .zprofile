#
# ~/.zprofile
#

# [[ -f ~/.zshrc]] && . ~/.zshrc


# [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx --vt1

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep awesome || startx
fi
