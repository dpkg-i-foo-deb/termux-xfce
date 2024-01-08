#!/bin/sh
clear
echo "Installing Termux-X11 package"

sleep 5

pkg install termux-x11-nightly -y

clear

echo "Allowing external apps to be installed"

sleep 5

sed -i '12s/^#//' ~/.termux/termux.properties

clear

echo "Installing Termux-X11 Android package"

sleep 5

#Original Android package from https://github.com/termux/termux-x11/releases/tag/nightly

cp app-universal-debug.apk ~/storage/downloads/termux-x11.apk

termux-open ~/storage/downloads/termux-x11.apk
