#!/bin/bash

sudo pacman -S  xf86-video-intel \
                xf86-input-synaptics \
                xorg-server xorg-xinit \
                xorg-xrdb \
                spectrwm \
                rxvt-unicode \
                wget \
                feh \
                scrot \
                imagemagick \
                alsa-lib \
                alsa-utils \
                screenfetch \
                terminus-font \
                ttf-dejavu \
                ttf-droid \
                ttf-inconsolata \
                xbindkeys \
                apache \
                python

home=/home/adion
aur=${home}/aur
mkdir -p $aur
cd $aur

wget https://aur.archlinux.org/cgit/aur.git/snapshot/dmenu2.tar.gz \
    https://aur.archlinux.org/cgit/aur.git/snapshot/lemonbar-xft-git.tar.gz \
    https://aur.archlinux.org/cgit/aur.git/snapshot/i3lock-color-git.tar.gz \
    https://aur.archlinux.org/cgit/aur.git/snapshot/google-chrome.tar.gz \
    https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-font-awesome.tar.gz \
    https://aur.archlinux.org/cgit/aur.git/snapshot/sublime-text.tar.gz

for pkg in dmenu2 lemonbar-xft-git i3lock-color-git google-chrome ttf-font-awesome sublime-text; do
    tar xzf ${pkg}.tar.gz
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
ln -sf ${dotfiles}/spectrwm.conf .spectrwm.conf
ln -sf ${dotfiles}/spectrwm_us.conf .spectrwm_us.conf
ln -sf ${dotfiles}/vimrc .vimrc
ln -sf ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -sf ${dotfiles}/xinitrc .xinitrc
ln -sf ${dotfiles}/Xresources .Xresources
