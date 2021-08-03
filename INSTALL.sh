#!/bin/bash

#sudo pacman -S xf86-video-ati \
#               xorg-server \
#               xorg-xinit \
#               xorg-xrdb \
#               xorg-xrandr \
#               xbindkeys \
#               spectrwm \
#               rxvt-unicode \
#               autocutsel \
#               tmux \
#               i3lock \
#               scrot \
#               imagemagick \
#               screenfetch \
#               zip \
#               unzip \
#               openssh \
#               bluez \
#               bluez-utils \
#               python2-virtualenv \
#               python2-setuptools \
#               vagrant \
#               virtualbox \
#               rsync \
#               nmap \
#               net-tools \
#               feh \
#               alsa-lib \
#               alsa-utils \
#               ttf-inconsolata \
#               ttf-croscore

sudo yum install automake \       # tmux dependencies
                 libevent \       #
                 libevent-devel \ #
                 ncurses \        #
                 ncurses-devel \  #
                 gcc \            #
                 make \           #
                 bison \          #
                 pkg-config       #
 
HOME=/home/adion
BUILD=$HOME/build
 
# TMUX
######
cd $BUILD
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install
 
#git clone https://github.com/tmux-plugins/tmux-resurrect
 
dotfiles=${home}/dotfiles
cd $home
 
ln -sf ${dotfiles}/bash_profile .bash_profile
ln -sf ${dotfiles}/bashrc .bashrc
ln -sf ${dotfiles}/gitconfig .gitconfig
ln -sf ${dotfiles}/tmux.conf .tmux.conf
ln -sf ${dotfiles}/vimrc .vimrc
 
# # fonts
# # https://www.reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily
# # $ fc-list : file | sort
# sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
# sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
# sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
# # vim /etc/profile.d/freetype2.sh
# # uncomment 'export FREETYPE_PROPERTIES' line
# # there is more, but this seems to be sufficient

git config user.name "Andrew Dion"
git config user.email "andrew.r.dion@gmail.com"
