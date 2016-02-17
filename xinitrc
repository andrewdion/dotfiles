#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout dvorak

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xbindkeys &
sh /home/adion/.fehbg &
/home/adion/dotfiles/status.sh | lemonbar -p -d -f "FontAwesome:size=10" -f "DejaVu Sans:size=10" -g 1366x21 -B#242424 &
exec spectrwm
