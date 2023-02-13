#!/bin/bash 
cp -lrf configs/. ~
source ~/.bashrc

#lightdm
sudo systemctl enable lightdm
sudo cp -r lightdm/. /etc/lightdm
mkdir -p /usr/share/pixmaps
sudo cp lightdm/greeter.png /usr/share/pixmaps/greeter.png
