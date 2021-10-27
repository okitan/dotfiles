#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type load_homebrew >/dev/null; then
  source "$dir"/../zsh/homebrew.sh
fi

if ! type brew >/dev/null; then
  (
    set -x
    "$dir"/../bootstrap/homebrew.sh
  )
  load_homebrew
fi

# dropbox is banned
# google-chrome, slack may be installed manually
# google-cloud-sdk, karabiner-element and visual-studio-code is installed in each script
packages=(docker franz google-japanese-ime)
(
  set -x
  brew install --cask "${packages[@]}"
)

cat <<__EOF__
* docker
  * TODO:
* franz
* google-japanese-ime
  * run ConfigDialog from LaunchPad and reboot
  * open IME Configuration screen and add it
__EOF__
