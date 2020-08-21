#!/usr/bin/env bash

sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt-get update

printf 'Removing unused softwares\n\n'
sudo apt-get purge -y $(cat packages/unused.txt)

printf 'Installing user softwares\n\n'
sudo apt-get install -y $(cat packages/user.txt)

printf 'Installing user softwares with flatpak\n\n'
flatpak install -y $(cat packages/flatpak_user.txt)

printf 'Clean repository cache\n\n'
sudo apt-get clean
sudo apt-get -y autoremove

printf 'Adjusting system clock\n\n'
timedatecrl set-locale-rtc true

printf "Configuring git\n\n"
git config --global user.email "leonardoviana098@gmail.com"
git config --global user.name "leonardov31"

printf 'Adding user to virtual machine group\n\n'
sudo adduser leonardo kvm

printf 'Configuring fish shell\n\n'
sudo chsh -s $(which fish) leonardo

printf 'Creating folder for dev setup\n\n'
mkdir ~/.dev

printf 'Installing development softwares\n\n'
bash dev-setup/install_all.fish

printf 'Restoring settings via dconf\n\n'
dconf load / < dconf-settings.ini

printf 'Updating System\n\n'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

printf 'Setting up Oh-My-Fish\n\n'
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf