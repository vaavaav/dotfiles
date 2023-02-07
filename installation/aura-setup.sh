#!/bin/bash

sudo pacman -S --needed base-devel git # pre-requisites 
rm -rf aura-bin
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -si