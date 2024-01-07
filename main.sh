#!/bin/sh

echo "This script will attempt to install and configure XFCE on Termux"

sh ./setup_termux.sh
sh ./install_xfce.sh
sh ./install_termux_x11.sh
sh ./setup_proot.sh

chmod +x start.sh

cp start.sh ~/../usr/bin/start-de

chmod +x stop.sh

cp stop.sh ~/../usr/bin/stop-de
