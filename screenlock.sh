#!/bin/bash

TMPBG=/tmp/screenshot.png
scrot $TMPBG
convert $TMPBG -scale 5% -scale 2000% $TMPBG
i3lock -i $TMPBG
rm $TMPBG

#img=$(ls /home/adion/dotfiles/wall_dual_*.png | sort -R | head -1)

# switch wallpaper on every lock
#/home/adion/feh-switch.sh

#img=/home/adion/wallpapers/.active
#i3lock -i $img
