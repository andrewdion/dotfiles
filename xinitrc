#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#/home/adion/dotfiles/feh-switch.sh

export ALSA_CARD=ODACrevB

#setxkbmap -layout dvorak -option caps:escape
setxkbmap -v us -variant dvorak -option caps:escape
xbindkeys

xrandr --output HDMI-2 --auto --rotate left --output HDMI-1 --right-of HDMI-2
#xrandr --output HDMI-2 --auto --rotate left --output DP-1 --right-of HDMI-2 --output HDMI-1 --off
#xrandr --output HDMI-2 --auto --rotate left --output DP-1 --off --output HDMI-1 --mode 1920x1080 --right-of HDMI-2

autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec spectrwm
