#!/bin/bash

# PACKAGES TO INSTALL
# xf86-video-ati
# xorg-server
# xorg-xinit
# xorg-xrdb
# spectrwm
# urxvt 
# vim
# git
# chromium
# wget
# feh
# scrot
# imagemagick
# alsa-lib
# alsa-utils
# screenfetch
# fonts:
#  terminus-font
#  ttf-dejavu
#  ttf-droid
#  ttf-inconsolata
# xbindkeys
# apache
# python
# dmenu2 (aur)
# lemonbar-xft-git (aur)
# i3lock-color-git (aur)
# google-chrome (aur)
# ttf-font-awesome (aur)
# sublime-text (aur)

home=/home/adion
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
