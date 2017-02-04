#!/bin/bash

icon=/home/adion/dotfiles/lock-icon.png
tmpbg=/tmp/screenshot.png

scrot $tmpbg
#convert $tmpbg -scale 10% -scale 1000% -fill black -colorize 80% $tmpbg
convert $tmpbg -scale 10% -scale 1000% $tmpbg
#convert $tmpbg -scale 10% -scale 1000% $tmpbg
#convert $tmpbg $icon -gravity center -composite -matte $tmpbg
i3lock -i $tmpbg
#i3lock -i $tmpbg \
#    --insidevercolor=00000000 \
#    --insidewrongcolor=00000000 \
#    --insidecolor=00000000 \
#    --ringvercolor=ffff00ff \
#    --ringwrongcolor=ff0000ff \
#    --ringcolor=00ff00ff \
#    --linecolor=00000000 \
#    --textcolor=00000000 \
#    --keyhlcolor=006600ff \
#    --bshlcolor=ff0000ff
