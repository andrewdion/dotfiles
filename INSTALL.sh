#!/bin/bash

sudo pacman -S xf86-video-ati \
               xorg-server \
               xorg-xinit \
               xorg-xrdb \
               xorg-xrandr \
               xbindkeys \
               xvkbd \
               openssh \
               spectrwm \
               rxvt-unicode \
               autocutsel \
               tmux \
               wget \
               i3lock \
               scrot \
               imagemagick \
               alsa-lib \
               alsa-utils \
               screenfetch \
               ttf-inconsolata \
               ttf-droid \
               zip \
               unzip \
               python2-virtualenv \
               python2-setuptools \
               rsync \
               nmap \
               net-tools \
               openconnect \
               htop
#               feh \
#               bluez \
#               bluez-utils \
#               cups
#               vagrant \
#               virtualbox \
#               terminus-font \

# some nice fonts:
# ttf-liberation
# ttf-roboto
# ttf-dejavu
# ttf-chroscore
# noto-fonts

home=/home/adion

aur=${home}/aur
mkdir -p $aur
cd $aur

aur_www="https://aur.archlinux.org/cgit/aur.git/snapshot/"

for pkg in dmenu2 \
           google-chrome; do
#           i3-gaps-git; do
#           hipchat; do
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
ln -sf ${dotfiles}/tmux.conf .tmux.conf
ln -sf ${dotfiles}/vimrc .vimrc
ln -sf ${dotfiles}/xbindkeysrc .xbindkeysrc
ln -sf ${dotfiles}/xinitrc .xinitrc
ln -sf ${dotfiles}/Xresources .Xresources

# auto login
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
# for some reason this doesn't like symlinks
sudo cp ${dotfiles}/autologin /etc/systemd/system/getty@tty1.service.d/override.conf

#sudo ln -sf ${dotfiles}/mouse-sensitivity /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

# ?
sudo ln -sf ${dotfiles}/logind.conf /etc/systemd/logind.conf
