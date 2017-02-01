#!/bin/bash

sudo pacman -S xf86-video-ati \
                xorg-server \
                xorg-xinit \
                xorg-xrdb \
                xorg-xrandr \
                xbindkeys \
                xvkbd \
                rxvt-unicode \
                tmux \
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

sudo systemctl start bluetooth
sudo systemctl enable bluetooth

# auto login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
# for some reason this doesn't like symlinks
sudo cp ${doftiles}/autologin /etc/systemd/system/getty@tty1.service.d/override.conf

sudo ln -sf ${dotfiles}/mouse-sensitivity /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

# i3
i3=${home}/.config/i3
mkdir -p $i3
ln -sf ${dotfiles}/i3 ${i3}/config
