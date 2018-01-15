#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#/home/adion/dotfiles/feh-switch.sh

setxkbmap -layout dvorak

#xbindkeys &
setxkbmap -option caps:escape &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec spectrwm
