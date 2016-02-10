#!/bin/bash

# PACKAGES TO INSTALL
# xf86-video-ati
# xorg-server
# xorg-xinit
# xorg-xrdb
# vim
# spectrwm
# urxvt 
# git
# chromium
# wget
# feh
# scrot
# imagemagick
# epdfview?
# alsa-lib
# alsa-utils
# slim
# screenfetch
# fonts (terminus-font, ttf-dejavu, ttf-droid, ttf-inconsolata)
# xbindkeys

home=/home/adion
dotfiles=${home}/dotfiles

cd $home

ln -s ${dotfiles}/asoundrc .asoundrc
ln -s ${dotfiles}/bash_profile .bash_profile
ln -s ${dotfiles}/bashrc .bashrc
ln -s ${dotfiles}/gitconfig .gitconfig
ln -s ${dotfiles}/spectrwm.conf .spectrwm.conf
ln -s ${dotfiles}/spectrwm_us.conf .spectrwm_us.conf
ln -s ${dotfiles}/status.sh .status.sh
ln -s ${dotfiles}/vimrc .vimrc
ln -s ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -s ${dotfiles}/xinitrc .xinitrc
ln -s ${dotfiles}/Xresources .Xresources
