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
i3status | dzen2 -ta r -fg white -bg black -fn -*-terminus-*-*-*-*-10-*-*-*-*-*-*-* &
exec spectrwm
