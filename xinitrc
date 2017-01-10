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
/home/adion/.fehbg &
exec i3
#exec openbox-session
