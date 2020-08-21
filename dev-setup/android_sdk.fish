#!/usr/bin/env fish

printf 'Setting up Android SDK and AVD\n\n'

mkdir ~/.dev/android-sdk
set ANDROID_HOME ~/.dev/android-sdk

mkdir $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools

wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip

unzip commandlinetools-linux-6609375_latest.zip
rm commandlinetools-linux-6609375_latest.zip 

mv tools/ latest

set -U fish_user_paths $ANDROID_HOME/cmdline-tools/latest/bin $fish_user_paths

yes | sdkmanager "build-tools;30.0.1" "platforms;android-30" "platform-tools" "system-images;android-27;default;x86_64" "emulator"

avdmanager create avd -k "system-images;android-27;default;x86_64" -n Nexus5X -d 10

set -U fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
