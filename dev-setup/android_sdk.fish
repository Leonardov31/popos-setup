#!/usr/bin/env fish

mkdir ~/.dev/android-sdk
set ANDROID_HOME ~/.dev/android-sdk

mkdir $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools

wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip

unzip commandlinetools-linux-6609375_latest.zip
rm commandlinetools-linux-6609375_latest.zip 

mv tools/ latest

set -U fish_user_paths $ANDROID_HOME/cmdline-tools/latest/bin $fish_user_paths

yes | sdkmanager "build-tools;30.0.1" "platforms;android-30" "platform-tools"

set -U fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths
