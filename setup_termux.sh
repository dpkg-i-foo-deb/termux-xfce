#!/bin/sh

#clear
echo "Setting up storage and updating repositories..."
sleep 2

termux-setup-storage

mkdir -p ~/Desktop
mkdir -p ~/Downloads
mkdir -p ~/Documents
mkdir -p ~/Pictures
mkdir -p ~/Public
mkdir -p ~/Templates
mkdir -p ~/Music
mkdir -p ~/Videos

pkg update -y -o Dpkg::Options::="--force-confold"
pkg upgrade -y -o Dpkg::Options::="--force-confold"
pkg uninstall dbus -y
pkg install wget ncurses-utils dbus proot-distro x11-repo tur-repo pulseaudio pavucontrol-qt -y
