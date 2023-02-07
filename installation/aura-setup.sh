#!/bin/bash

sudo pacman -S --needed base-devel git # pre-requisites 
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -si