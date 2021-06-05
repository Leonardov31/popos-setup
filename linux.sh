#!/usr/bin/env bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository -u https://cli.github.com/packages

echo 'Removing unused softwares'
sudo apt-get purge -y $(cat packages/unused.txt)

echo 'Installing user softwares'
sudo apt-get install -y $(cat packages/user.txt)

echo 'Clearing repository cache'
sudo apt-get clean
sudo apt-get -y autoremove

echo 'Configuring git'
git config --global user.email "leonardoviana098@gmail.com"
git config --global user.name "leonardov31"

echo 'Adding user to virtual machine group'
sudo adduser leonardo kvm

echo 'Configuring fish shell'
sudo chsh -s /usr/bin/fish leonardo

echo 'Creating folder for dev setup'
mkdir ~/.dev

echo 'Fix xorg'
sudo sed -ri 's/^(.*modifier_map.*)/\/\/\1/' /usr/share/X11/xkb/symbols/br

echo 'Restoring settings via dconf'
dconf load / < dconf-settings.ini

echo 'Updating System'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
