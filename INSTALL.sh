#!/bin/bash

sudo pacman -S  xf86-video-intel \
                xf86-input-synaptics \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xbindkeys \
                iw \
                openssh \
                spectrwm \
                rxvt-unicode \
                feh \
                i3lock \
                scrot \
                imagemagick \
                alsa-lib \
                alsa-utils \
                screenfetch \
                ttf-inconsolata \
                ttf-chroscore \
                python \
                zip \
                unzip \
                openconnect

#                terminus-font \
#                ttf-dejavu \
#                sshfs \
#                libxkbcommon-x11 \

home=/home/adion

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in linux-samus4 \
           lemonbar-xft-git \
           ttf-font-awesome-4 \
           google-chrome \
           xvkbd; do
    wget ${aur_www}/${pkg}.tar.gz
    tar xf ${pkg}.tar.gz
    cd $pkg
    makepkg -sri
    cd ..
done
#           i3lock-color-git \
#           dmenu2 \
#           i3-gaps-git \
#           sublime-text \

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
#ln -sf ${dotfiles}/tmux.conf .tmux.conf

# lid switch actions
sudo ln -sf ${dotfiles}/logind.conf /etc/systemd/

# touchpad
sudo ln -sf ${dotfiles}/70-synaptics.conf /etc/X11/xorg.conf.d/

# grub
sudo ln -sf ${dotfiles}/grub /etc/default/

# auto login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo cp ${dotfiles}/override.conf /etc/systemd/system/getty@tty1.service.d/

# i3
#i3=${home}/.config/i3
#mkdir -p $i3
#ln -sf ${dotfiles}/i3 ${i3}/config
