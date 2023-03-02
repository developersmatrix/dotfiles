#!/bin/sh
#
[ $(echo -e "No\nYes" | dmenu -i -c -l 2 -p "$1")\
	== "Yes" ] && $2
