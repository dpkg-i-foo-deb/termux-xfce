#!/bin/sh

clear
echo "Updating packages"
sleep 5

pkg update -y -o Dpkg::Options::="--force-confold"
pkg upgrade -y -o Dpkg::Options::="--force-confold"

clear
echo "Updating repositories"
sleep 5

termux-change-repo

clear
echo "Installing git..."

sleep 5

apt update
apt install git -y

clear
echo "Cloning repository"

sleep 5

git clone https://github.com/dpkg-i-foo-deb/termux-xfce.git

cd termux-xfce || exit

./main.sh

cd ..

clear
echo "Deleting repository files"
sleep 5

rm -rf termux-xfce

clear
echo "Done! XFCE should be installed on Termux as well as Termux-X11"
echo "and Debian is configured using proot-distro, restart the Termux app"
echo "or source .bashrc to get started"
echo ""
echo "You can start the graphical environment running start-de and stop it using stop-de"
echo "It should bring up XFCE on Termux-X11"
echo ""
echo "You can enter the proot environment running debian and it will log you in with the user"
echo "you specified during the install"
