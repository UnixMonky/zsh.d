## Used for executing user's commands at start, will be read when starting as a
## login shell. Typically used to autostart graphical sessions and to set
## session-wide environment variables.

# Autostart X using startx after tty login.
if [[ $(uname -s) != "Darwin" ]] && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
