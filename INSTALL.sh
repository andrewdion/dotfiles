#!/bin/bash

sudo pacman -S  xf86-video-intel \
                xf86-input-synaptics \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xev \
                xvkbd \
                xbindkeys \
                libxkbcommon-x11 \
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
                python \
                unzip

home=/home/adion

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in linux-samus4 \
           dmenu2 \
           i3-gaps-git \
           i3lock-color-git \
           lemonbar-xft-git \
           google-chrome \
           ttf-font-awesome \
           sublime-text; do
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
sudo ln -sf ${dotfiles}/logind.conf /etc/systemd/logind.conf
sudo ln -sf ${dotfiles}/grub /etc/default/grub
#sudo ln -sf ${dotfiles}/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf

# i3
i3=${home}/.config/i3
mkdir -p $i3
ln -sf ${dotfiles}/i3 ${i3}/config

# spectrwm
#sudo pacman -S spectrwm
#ln -sf ${dotfiles}/spectrwm.conf .spectrwm.conf
#ln -sf ${dotfiles}/spectrwm_us.conf .spectrwm_us.conf

# openbox
#sudo pacman -S openbox
#openbox=${home}/.config/openbox
#mkdir -p $openbox
#ln -sf ${dotfiles}/rc.xml ${openbox}/rc.xml
