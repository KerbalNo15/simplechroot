#!/bin/bash
mkdir -p simplechroot overlayroot workingdir
mount -t overlay overlay -olowerdir=/,upperdir=overlayroot,workdir=workingdir simplechroot
rm simplechroot/etc/resolv.conf
echo "nameserver 1.1.1.1" > simplechroot/etc/resolv.conf
echo "options edns0 trust-ad" >> simplechroot/etc/resolv.conf
echo "search lan" >> simplechroot/etc/resolv.conf
echo "Chroot prepared! Use ctrl+d to exit"
chroot simplechroot
umount simplechroot
echo "Do you want to destroy the chroot? [y/N]"
select yn in "Yes" "No"; do #Thanks to https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
	case $yn in
		Yes ) rm -rf simplechroot overlayroot workingdir; break;;
		No) echo "You can re-run this script again to destroy it later"; exit;;
	esac
done
