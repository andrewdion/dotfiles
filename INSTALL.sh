#!/bin/bash

sudo pacman -S  xf86-video-intel \
                xf86-input-synaptics \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xev \
                xvkbd \
                libxkbcommon-x11 \
                spectrwm \
                openbox \
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
                python \
                unzip

home=/home/adion

# for openbox config
openbox=${home}/.config/openbox
mkdir -p $openbox

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in linux-samus4 \
           dmenu2 \
           lemonbar-xft-git \
           i3lock-color-git \
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
ln -sf ${dotfiles}/spectrwm.conf .spectrwm.conf
ln -sf ${dotfiles}/spectrwm_us.conf .spectrwm_us.conf
ln -sf ${dotfiles}/rc.xml ${openbox}/rc.xml
ln -sf ${dotfiles}/vimrc .vimrc
ln -sf ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -sf ${dotfiles}/xinitrc .xinitrc
ln -sf ${dotfiles}/Xresources .Xresources
sudo ln -sf ${dotfiles}/logind.conf /etc/systemd/logind.conf
sudo ln -sf ${dotfiles}/grub /etc/default/grub
#sudo ln -sf ${dotfiles}/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
