#!/bin/bash 

# x11
ln configs/.xinitrc ~/.xinitrc

# i3
mkdir -p ~/.config/i3
ln configs/i3config ~/.config/i3/config

# setting iosevka as default monospace font
mkdir -p ~/.config/fontconfig
ln configs/fonts.conf ~/.config/fontconfig/fonts.conf

# alacritty 
mkdir -p ~/.config/alacritty
ln configs/alacritty.yml ~/.config/alacritty.yml

# bashrc
ln configs/.bashrc ~/.bashrc
source ~/.bashrc

# vimrc
ln configs/.vimrc ~/.vimrc

# picom
ln configs/picom.conf ~/.config/picom.conf

# polybar
mkdir -p ~/.config/polybar/launch.sh
ln configs/polybar/launch.sh ~/.config/polybar/launch.sh
ln configs/polybar/config ~/.config/polybar/config.ini
