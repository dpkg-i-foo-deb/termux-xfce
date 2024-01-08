#!/bin/sh

echo "Installing proot-distro"
pkg install proot-distro -y

clear
echo "Installing Debian using proot-distro"

sleep 5

proot-distro install debian

clear
read -r -p "Please enter username for proot installation: " username </dev/tty

proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 apt update
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 apt install apt-utils -y
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 apt upgrade -y
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 apt install sudo wget -y

proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 groupadd storage
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 groupadd wheel
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 useradd -m -g users -G wheel,audio,video,storage -s /bin/bash "$username"
proot-distro login debian --user "$username" --shared-tmp -- env DISPLAY=:1.0 echo "alias virgl='GALLIUM_DRIVER=virpipe '" >>~/.bashrc

chmod u+rw ~/../usr/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers
echo "$username ALL=(ALL) NOPASSWD:ALL" | tee -a ~/../usr/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers >/dev/null
chmod u-w ~/../usr/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers

echo "export DISPLAY=:1.0" >>~/../usr/var/lib/proot-distro/installed-rootfs/debian/home/"$username"/.bashrc

timezone=$(getprop persist.sys.timezone)
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 rm /etc/localtime
proot-distro login debian --shared-tmp -- env DISPLAY=:1.0 cp /usr/share/zoneinfo/"$timezone" /etc/localtime

cp ~/../usr/var/lib/proot-distro/installed-rootfs/debian/etc/skel/.bashrc ~/.bashrc

clear
echo "Setting up audio & aliases"
sleep 5

echo "
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
  " >~/.sound

echo "
alias debian='proot-distro login debian --user $username --shared-tmp'
  " >>~/.bashrc

echo "
source .sound" >>~/.bashrc
