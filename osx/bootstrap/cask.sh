#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

# dropbox is banned
# google-cloud-sdk, karabiner-element and visual-studio-code is installed in each script
packages=(docker franz google-chrome google-japanese-ime iterm2 slack)
for pkg in "${packages[@]}"; do
  (
    set -x
    brew cask install $pkg --appdir=/Applications
  )
done

cat <<__EOF__
* docker
  * TODO:
* dropbox
  * run, signin and choose which folders to sync
* google-chrome
  * run and make it default browser
* google-cloud-sdk
  * noop
* google-japanese-ime
  * run ConfigDialog from LaunchPad and reboot
  * open IME Configuration screen and add it
* iterm2
  * TODO:
__EOF__
