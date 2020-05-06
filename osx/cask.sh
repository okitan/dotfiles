#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

# dropbox is banned
# google-cloud-sdk, karabiner-element and visual-studio-code is installed in each script
packages=(docker franz google-chrome google-japanese-ime iterm2 slack)
(
  set -x
  brew cask install "${packages[@]}" --appdir=/Applications
)

cat <<__EOF__
* docker
  * TODO:
* dropbox
* google-chrome
  * run and make it default browser
* google-japanese-ime
  * run ConfigDialog from LaunchPad and reboot
  * open IME Configuration screen and add it
* iterm2
  * TODO:
* slack
  * TODO:
__EOF__
