#!/usr/bin/env bash

sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update

echo 'Removing unused softwares'
sudo apt-get purge -y $(cat packages/unused.txt)

echo 'Installing user softwares'
sudo apt-get install -y $(cat packages/user.txt)

echo 'Clean repository cache'
sudo apt-get  clean
sudo apt-get -y autoremove

echo 'Adjusting system clock'
timedatecrl set-locale-rtc true

echo "Configuring git"
git config --global user.name "leonardov31"
git config --global user.email "leonardoviana098@gmail.com"

echo 'Adding user to virtual machine group'
sudo adduser leonardo kvm

echo 'Configuring fish shell'
sudo chsh -s $(which fish) viana

echo 'Restoring settings via dconf'
dconf load / < dconf-settings.ini

echo 'Updating System'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
