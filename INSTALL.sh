#!/bin/bash

sudo pacman -S  xf86-video-ati \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xrandr \
                xorg-xbindkeys \
                rxvt-unicode \
                wget \
                feh \
                scrot \
                imagemagick \
                firefox \
                i3lock \
                alsa-lib \
                alsa-utils \
                screenfetch \
                terminus-font \
                ttf-dejavu \
                ttf-droid \
                ttf-inconsolata \
                python \
                unzip \
                bluez \
                bluez-utils

home=/home/adion

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in dmenu2 \
           i3-gaps-git \
           hipchat \
           google-chrome; do
    wget ${aur_www}/${pkg}.tar.gz
    tar xf ${pkg}.tar.gz
    cd $pkg
    makepkg -sri
    cd ..
done

dotfiles=${home}/dotfiles
cd $home

ln -sf ${dotfiles}/asoundrc .asoundrc
ln -sf ${dotfiles}/bash_profile .bash_profile
ln -sf ${dotfiles}/bashrc .bashrc
ln -sf ${dotfiles}/fehbg .fehbg
ln -sf ${dotfiles}/gitconfig .gitconfig
ln -sf ${dotfiles}/vimrc .vimrc
ln -sf ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -sf ${dotfiles}/xinitrc .xinitrc
ln -sf ${dotfiles}/Xresources .Xresources
sudo ln -sf ${dotfiles}/bluetooth.conf /etc/bluetooth/main.conf
sudo ln -sf ${dotfiles}/udev-bluetooth-poweron /etc/udev/rules.d/10-bluetooth.rules
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo ln -sf ${dotfiles}/autologin.conf /etc/systemd/system/getty@tty1.service.d/override.conf

# i3
i3=${home}/.config/i3
mkdir -p $i3
ln -sf ${dotfiles}/i3 ${i3}/config

# openbox
#sudo pacman -S openbox
#openbox=${home}/.config/openbox
#mkdir -p $openbox
#ln -sf ${dotfiles}/rc.xml ${openbox}/rc.xml
