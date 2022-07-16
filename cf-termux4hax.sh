#!/bin/sh
pkg install figlet -y
figlet termux4hax
echo 'NOTE: You can now install cloudflared directly from Termux repos.'
echo 'NOTE: To install it from source instead, open the script and comment out the next two lines.'
pkg install cloudflared
exit
# ^ comment out these lines to proceed with the script

echo "--upgrading packages"
yes "" | pkg update

echo "-- installing dependancies: golang git debianutils make"
yes "" | pkg install golang git debianutils make

echo "-- downloading cloudflared source"
git clone https://github.com/cloudflare/cloudflared.git --depth=1
cd cloudflared
sed -i 's/linux/android/g' Makefile

echo "-- building and installing cloudflared" 
make cloudflared
install cloudflared /data/data/com.termux/files/usr/bin

echo "-- Visit termux4hax.blogspot.com for more"
