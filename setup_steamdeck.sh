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

# install wine
sudo pacman -Syu wine

# install winetricks
sudo pacman -Syu winetricks

# install dotnet48
winetricks dotnet48

# install cjk font
winetricks cjkfonts

# reboot wine
wineserver -k && wineboot

# install yay from binary
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
git checkout 96f90180a3cf72673b1769c23e2c74edb0293a9f
makepkg -si

# install 1password
yay -S 1password

# install japanese input method
yay -S fcitx5-im fcitx5-mozc

# install git-credential-manager
yay -S git-credential-manager

# disable again the write over file system (steam os block)
sudo steamos-readonly enable
