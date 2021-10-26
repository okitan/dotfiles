#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

# dropbox is banned
# google-cloud-sdk, karabiner-element and visual-studio-code is installed in each script
packages=(docker franz google-chrome google-japanese-ime slack)
for package in "${packages[@]}"; do
  if [[ ! -d "/Applications/${package}.app" ]]; then
    (
      set -x
      brew install "${package}" --appdir=/Applications
    )
  fi
done

cat <<__EOF__
* docker
  * TODO:
* franz
* google-chrome
  * run and make it default browser
* google-japanese-ime
  * run ConfigDialog from LaunchPad and reboot
  * open IME Configuration screen and add it
* slack
__EOF__
