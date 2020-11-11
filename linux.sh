#!/usr/bin/env bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository -u https://cli.github.com/packages
sudo apt-get update

echo 'Removing unused softwares'
sudo apt-get purge -y $(cat packages/unused.txt)

echo 'Installing user softwares'
sudo apt-get install -y $(cat packages/user.txt)

echo 'Clean repository cache'
sudo apt-get clean
sudo apt-get -y autoremove

echo 'Adjusting system clock'
timedatecrl set-locale-rtc true

echo 'Configuring git'
git config --global user.email "leonardoviana098@gmail.com"
git config --global user.name "leonardov31"

echo 'Adding user to virtual machine group'
sudo adduser leonardo kvm

echo 'Creating folder for dev setup'
mkdir ~/.dev

echo 'Restoring settings via dconf'
dconf load / < dconf-settings.ini

echo 'Updating System'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
