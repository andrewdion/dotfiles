#!/bin/bash

sudo pacman -S xf86-video-ati \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xrandr \
                xbindkeys \
                xvkbd \
                rxvt-unicode \
                wget \
                feh \
                i3lock \
                scrot \
                imagemagick \
                firefox \
                alsa-lib \
                alsa-utils \
                screenfetch \
                terminus-font \
                ttf-dejavu \
                ttf-droid \
                ttf-inconsolata \
                python \
                unzip \
                openssh \
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

# don't need this if using udev rule and systemd service
#sudo ln -sf ${dotfiles}/bluetooth.conf /etc/bluetooth/main.conf

sudo systemctl start bluetooth
sudo systemctl enable bluetooth

# auto power controller on
sudo ln -sf ${dotfiles}/bluetooth-udev.rules /etc/udev/rules.d/10-local.rules
# systemd doesn't seem to like linked service files, so copy to custom service dir
sudo cp ${dotfiles}/bluetooth-auto-power@.service /etc/systemd/system/
sudo systemctl enable ${dotfiles}/bluetooth-auto-power@

# doesn't currently work
#sudo ln -sf ${dotfiles}/autologin.service /etc/systemd/system/getty.target.wants/getty@tty1.service

# i3
i3=${home}/.config/i3
mkdir -p $i3
ln -sf ${dotfiles}/i3 ${i3}/config
