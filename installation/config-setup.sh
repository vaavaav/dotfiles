#!/bin/bash 

# i3
mkdir -p ~/.config/i3
ln ../configs/i3config ~/.config/i3/config

# setting iosevka as default monospace font
mkdir -p ~/.config/fontconfig
ln ../configs/fonts.conf ~/.config/fontconfig/fonts.conf

# alacritty 
mkdir -p ~/.config/alacritty
ln ../configs/alacritty.yml ~/.config/alacritty.yml

# bachrc
ln ../configs/.bashrc ~/.bachrc