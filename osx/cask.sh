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
# google-cloud-sdk and karabiner-element is installed in each script
packages=(arc cursor google-japanese-ime rancher visual-studio-code)
(
  set -x
  brew install --cask "${packages[@]}"
)

cat <<__EOF__
* google-japanese-ime
  * run ConfigDialog from LaunchPad and reboot
  * open IME Configuration screen and add it
* rancher
  * open Rancher Desktop and set the following settings
    * Kubernetes: disabled
    * Container Engine: moby
__EOF__
