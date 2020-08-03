#!/usr/bin/env fish

echo "Flutter Setup"

cd ~/.dev

git clone https://github.com/flutter/flutter.git

set -U fish_user_paths ~/.dev/flutter/bin $fish_user_paths

flutter channel beta
flutter upgrade
flutter config --enable-web
yes | flutter doctor --android-licenses
flutter doctor -v

