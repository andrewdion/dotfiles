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

setxkbmap -option caps:escape &
xbindkeys &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec spectrwm

# dual monitor seems to work fine without these
#exec xrandr --output DVI-0 --auto --output DVI-1 --auto &
#exec xrandr --output DVI-0 --auto --rotate left --output DVI-1 --auto &
