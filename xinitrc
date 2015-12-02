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
#conky | dzen2 -w "600" -x "766" -ta r -fg "#cccccc" -bg "#222222" -fn -*-terminus-*-*-*-*-10-*-*-*-*-*-*-* &
i3status | dzen2 -w "600" -x "766" -ta r -fg "#cccccc" -bg "#222222" -fn -*-terminus-*-*-*-*-10-*-*-*-*-*-*-* &
exec spectrwm
