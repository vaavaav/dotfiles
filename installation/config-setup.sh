#!/bin/bash 

# x11
ln -f configs/.xinitrc ~/.xinitrc

# i3
mkdir -p ~/.config/i3
ln -f configs/i3config ~/.config/i3/config

# setting iosevka as default monospace font
mkdir -p ~/.config/fontconfig
ln -f configs/fonts.conf ~/.config/fontconfig/fonts.conf

# alacritty 
mkdir -p ~/.config/alacritty
ln -f configs/alacritty.yml ~/.config/alacritty.yml

# bashrc
ln -f configs/.bashrc ~/.bashrc
source ~/.bashrc

# vimrc
ln -f configs/.vimrc ~/.vimrc

# picom
ln -f configs/picom.conf ~/.config/picom.conf

# polybar
mkdir -p ~/.config/polybar/launch.sh
ln -f configs/polybar/launch.sh ~/.config/polybar/launch.sh
ln -f configs/polybar/config ~/.config/polybar/config.ini
