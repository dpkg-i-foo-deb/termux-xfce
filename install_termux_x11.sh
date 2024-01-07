#!/bin/sh
#clear
echo "Installing Termux-X11 package"

sleep 2

pkg install termux-x11-nightly -y

#clear
echo "Installing Termux-X11 Android package"

sleep 2

#Original Android package from https://github.com/termux/termux-x11/releases/tag/nightly

termux-open app-universal-debug.apk
