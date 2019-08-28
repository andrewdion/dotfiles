#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sudo chown adion:adion /sys/class/backlight/intel_backlight/brightness
sudo chown adion:adion /sys/class/leds/chromeos::kbd_backlight/brightness

xmodmap -e "keycode 133 = Escape NoSymbol Escape" &
setxkbmap -layout dvorak &
xbindkeys &
sh /home/adion/.fehbg &
/home/adion/dotfiles/status.sh | lemonbar -p -d -f "FontAwesome:size=12" -f "DejaVu Sans:size=10" -g 2560x38 -B#242424 &
exec spectrwm
