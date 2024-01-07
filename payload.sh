#!/bin/sh

echo "Updating packages"
sleep 5

pkg update -y -o Dpkg::Options::="--force-confold"
pkg upgrade -y -o Dpkg::Options::="--force-confold"

echo "Updating repositories"
termux-change-repo

#clear
echo "Installing git..."

sleep 5

apt update
apt install git -y

#clear
echo "Cloning repository"

sleep 5

git clone https://github.com/dpkg-i-foo-deb/termux-xfce.git

cd termux-xfce || exit

./main.sh

cd ..

rm -rf termux-xfce
