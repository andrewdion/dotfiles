#!/bin/bash

sudo pacman -S  xf86-video-intel \
                xf86-input-synaptics \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xrandr \
                xorg-xev \
                xorg-xmodmap \
                xbindkeys \
                openssh \
                spectrwm \
                rxvt-unicode \
                feh \
                i3lock \
                scrot \
                imagemagick \
                screenfetch \
                ttf-inconsolata \
                ttf-croscore \
                ttf-dejavu \
                zip \
                unzip \
                openconnect \
                alsa-lib \
                alsa-utils \
                bluez \
                bluez-utils \
                python

home=/home/adion

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in lemonbar-xft-git \
           ttf-font-awesome-4 \
           google-chrome \
           xvkbd; do
    wget ${aur_www}/${pkg}.tar.gz
    tar xf ${pkg}.tar.gz
    cd $pkg
    makepkg -sri
    cd ..
done
#           linux-samus4 \
#           i3lock-color-git \

dotfiles=${home}/dotfiles
cd $home

ln -sf ${dotfiles}/asoundrc .asoundrc
ln -sf ${dotfiles}/bash_profile .bash_profile
ln -sf ${dotfiles}/bashrc .bashrc
ln -sf ${dotfiles}/fehbg .fehbg
ln -sf ${dotfiles}/gitconfig .gitconfig
ln -sf ${dotfiles}/spectrwm.conf.chromebook .spectrwm.conf
ln -sf ${dotfiles}/spectrwm_us.conf .spectrwm_us.conf
ln -sf ${dotfiles}/tmux.conf .tmux.conf
ln -sf ${dotfiles}/vimrc .vimrc
ln -sf ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -sf ${dotfiles}/xinitrc .xinitrc
ln -sf ${dotfiles}/Xresources .Xresources
ln -sf ${dotfiles}/bin bin

# doesn't like symlinks
sudo cp ${dotfiles}/bluetooth.conf /etc/bluetooth/main.conf
sudo systemctl start bluetooth
sudo systemctl enable bluetooth

# power key / lid switch actions
sudo cp ${dotfiles}/logind.conf /etc/systemd/

# touchpad
sudo mkdir -p /etc/X11/xorg.conf.d
sudo ln -sf ${dotfiles}/touchpad.conf /etc/X11/xorg.conf.d/70-synaptics.conf

# grub
#sudo ln -sf ${dotfiles}/grub.conf /etc/default/grub

# auto login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${dotfiles}/autologin.conf /etc/systemd/system/getty@tty1.service.d/override.conf
