#! /bin/bash

#sudo password setup
passwd

# allow to write over file system (steam os block)
sudo steamos-readonly disable

# ensure we have the keys updated
sudo pacman-key --init
sudo pacman-key --populate holo
sudo pacman-key --populate archlinux

# install git and base-devel dependencies
sudo pacman -S --needed git base-devel

# install yay from binary
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
git checkout 96f90180a3cf72673b1769c23e2c74edb0293a9f
makepkg -si

# disable again the write over file system (steam os block)
sudo steamos-readonly enable

# install google chrome
yay -S google-chrome