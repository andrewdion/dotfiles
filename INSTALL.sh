#!/bin/bash

sudo pacman -S xf86-video-ati \
               xorg-server \
               xorg-xinit \
               xorg-xrdb \
               xbindkeys \
               openssh \
               spectrwm \
               rxvt-unicode \
               autocutsel \
               tmux \
               wget \
               i3lock \
               scrot \
               imagemagick \
               alsa-lib \
               alsa-utils \
               screenfetch \
               zip \
               unzip \
               rsync \
               nmap \
               net-tools \
               openconnect \
               bluez \
               bluez-utils \
               ttf-inconsolata \
               ttf-croscore
#               xorg-xrandr \
#               python2-virtualenv \
#               python2-setuptools \
#               feh \
#               cups
#               vagrant \
#               virtualbox \
#               terminus-font \

# some nice fonts:
# ttf-liberation
# ttf-roboto
# ttf-dejavu
# ttf-croscore
# noto-fonts

home=/home/adion

aur=$home/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in google-chrome \
           xvkbd; do
    wget ${aur_www}/${pkg}.tar.gz
    tar xf ${pkg}.tar.gz
    cd $pkg
    makepkg -sri
    cd ..
done
#          i3-gaps-git \

dotfiles=$home/dotfiles
cd $dotfiles

cd $home

cp -r $dotfiles/bin bin

ln -sf $dotfiles/asoundrc .asoundrc
ln -sf $dotfiles/bash_profile .bash_profile
ln -sf $dotfiles/bashrc .bashrc
ln -sf $dotfiles/gitconfig .gitconfig
ln -sf $dotfiles/spectrwm_full .spectrwm.conf
ln -sf $dotfiles/spectrwm_us.conf .spectrwm_us.conf
ln -sf $dotfiles/tmux.conf .tmux.conf
ln -sf $dotfiles/vimrc .vimrc
ln -sf $dotfiles/Xresources .Xresources
ln -sf $dotfiles/xinitrc .xinitrc
ln -sf $dotfiles/xbindkeysrc .xbindkeysrc
#ln -sf $dotfiles/fehbg .fehbg

# make sure usb dongle is plugged in
sudo modprobe btusb
# doesn't like symlink here
sudo cp $dotfiles/bluetooth /etc/bluetooth/main.conf
sudo systemctl start bluetooth
sudo systemctl enable bluetooth

# auto login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
# for some reason this doesn't like symlinks
sudo cp $dotfiles/autologin /etc/systemd/system/getty@tty1.service.d/override.conf

#sudo ln -sf $dotfiles/mouse-sensitivity /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

# lid switch & power key actions
sudo ln -sf $dotfiles/logind.conf /etc/systemd/logind.conf

# fonts
# https://www.reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily
# $ fc-list : file | sort
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
# vim /etc/profile.d/freetype2.sh
# uncomment 'export FREETYPE_PROPERTIES' line
# there is more, but this seems to be sufficient
