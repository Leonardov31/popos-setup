#!/usr/bin/env bash

sudo apt update

echo 'Removing unused softwares'
sudo apt-get purge -y $(cat packages/unused.txt)

echo 'Installing user softwares'
sudo apt-get install -y $(cat packages/user.txt)

echo 'Clean repository cache'
sudo apt-get clean
sudo apt-get autoremove

echo 'Adjusting system clock'
timedatecrl set-locale-rtc true

echo 'Adding user to virtual machine group'
sudo adduser leonardo kvm

echo 'Configuring fish shell'
sudo chsh -s $(which fish) leonardo
curl -L https://get.oh-my.fish | fish
omf install agnoster

echo 'Restoring settings via dconf'
dconf load / < dconf-settings.ini

echo 'Updating System'
sudo apt-get update
sudo apt-get upgrade -y

