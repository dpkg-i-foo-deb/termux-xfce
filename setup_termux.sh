#!/bin/sh

clear
echo "Setting up storage and updating repositories..."
sleep 5

termux-setup-storage

mkdir -p ~/Desktop
mkdir -p ~/Downloads
mkdir -p ~/Documents
mkdir -p ~/Pictures
mkdir -p ~/Public
mkdir -p ~/Templates
mkdir -p ~/Music
mkdir -p ~/Videos

pkg uninstall dbus -y

echo "Installing required repositories"
pkg install x11-repo tur-repo -y

echo "Installing packages..."
pkg install wget ncurses-utils dbus pulseaudio pavucontrol-qt -y

pkg update -y -o Dpkg::Options::="--force-confold"
pkg upgrade -y -o Dpkg::Options::="--force-confold"
