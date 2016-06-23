#!/bin/bash

# PACKAGES TO INSTALL
# xf86-video-intel
# xorg-server
# xorg-xinit
# xorg-xrdb
# spectrwm
# urxvt 
# vim
# wget
# feh
# scrot
# imagemagick
# alsa-lib
# alsa-utils
# screenfetch
# terminus-font
# ttf-dejavu
# ttf-droid
# ttf-inconsolata
# xbindkeys
# apache
# python
# dmenu2 (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/dmenu2.tar.gz
# lemonbar-xft-git (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/lemonbar-xft-git.tar.gz
#  (pod2man requires adding /usr/bin/core_perl to PATH)
# i3lock-color-git (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/i3lock-color-git.tar.gz
# google-chrome (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/google-chrome.tar.gz
# ttf-font-awesome (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-font-awesome.tar.gz
# sublime-text (aur)
#  wget https://aur.archlinux.org/cgit/aur.git/snapshot/sublime-text.tar.gz

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
