#!/usr/bin/env zsh

echo 'Clonning Flutter'
git clone https://github.com/flutter/flutter.git ~/.dev/flutter

echo 'Adding flutter to path'
echo 'export PATH=$HOME/.dev/flutter/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

echo 'Upgrading flutter'
flutter upgrade

echo 'Flutter doctor'
flutter doctor -v