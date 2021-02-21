#!/usr/bin/env fish

echo 'Cloning Flutter'
git clone https://github.com/flutter/flutter.git ~/.dev/flutter

echo 'Adding flutter to path'
set -Ua fish_user_paths $HOME/.dev/flutter/bin

echo 'Upgrading flutter'
flutter upgrade
#yes | flutter doctor --android-licenses

echo 'Flutter doctor'
flutter doctor -v
