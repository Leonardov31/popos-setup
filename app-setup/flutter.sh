#!/usr/bin/env zsh

echo 'Cloning Flutter'
git clone https://github.com/flutter/flutter.git ~/.dev/flutter

echo 'Adding flutter to path'
echo 'export PATH=$HOME/.dev/flutter/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

echo 'Upgrading flutter'
flutter upgrade
yes | flutter doctor --android-licenses

echo 'Flutter doctor'
flutter doctor -v