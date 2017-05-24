#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout dvorak

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#/home/adion/dotfiles/feh-switch.sh

#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &
xbindkeys &
exec xrandr --output DVI-0 --auto --rotate left --output DVI-1 --auto &
exec spectrwm
#exec i3
