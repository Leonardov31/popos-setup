#!/usr/bin/env bash

echo 'Setup Flutter'

mkdir ~/.development
cd ~/.development

git clone https://github.com/flutter/flutter.git

echo 'export PATH="$PATH:~/.development/flutter/bin/"' >> ~/.bashrc
source ~/.bashrc

flutter upgrade

#--------------------------------------------------------------------

echo 'Setup Android Sdk'

mkdir ~/.development/android-sdk/

wget https://dl.google.com/android/repository/commandlinetools-linux-6514223_latest.zip

unzip commandlinetools-linux-6514223_latest.zip -d ~/.development/android-sdk
rm commandlinetools-linux-6514223_latest.zip

cd ~/.development/android-sdk
mv tools/ latest
mkdir cmdline-tools
mv latest/ cmdline-tools/

echo 'export PATH="$PATH:~/.development/android-sdk/platform-tools/"' >> ~/.bashrc
echo 'export PATH="$PATH:~/.development/android-sdk/cmdline-tools/latest/bin/"' >> ~/.bashrc

source ~/.bashrc

sdkmanager "build-tools;29.0.3" "platform-tools" "platforms;android-29"

