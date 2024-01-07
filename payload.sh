#!/bin/sh

echo "Updating packages"
sleep 2

pkg update -y -o Dpkg::Options::="--force-confold"
pkg upgrade -y -o Dpkg::Options::="--force-confold"

echo "Updating repositories"
termux-change-repo

#clear
echo "Installing git..."

sleep 2

apt update
apt install git -y

#clear
echo "Cloning repository"

sleep 2

git clone https://github.com/dpkg-i-foo-deb/termux-xfce.git

cd termux-xfce || exit

./main.sh

cd ..

rm -rf termux-xfce
