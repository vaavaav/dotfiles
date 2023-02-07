#!/bin/bash

sudo pacman -S --needed base-devel git # pre-requisites 
sudo rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si