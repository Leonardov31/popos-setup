#!/usr/bin/env fish

echo "Flutter Setup"

cd ~/.dev

git clone https://github.com/flutter/flutter.git -b beta --depth 1

set -U fish_user_paths ~/.dev/flutter/bin $fish_user_paths

flutter upgrade
yes | flutter doctor --android-licenses
flutter doctor -v

