#!/bin/bash

#tmpbg=/tmp/screenshot.png
#scrot $tmpbg
#convert $tmpbg -scale 10% -scale 1000% $tmpbg
#i3lock -u -i $tmpbg

#img=$(ls /home/adion/dotfiles/wall_dual_*.png | sort -R | head -1)
img=/home/adion/wallpapers/.active

i3lock -i $img
