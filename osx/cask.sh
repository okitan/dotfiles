#!/bin/bash

set -eu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! type load_homebrew >/dev/null; then
  # shellcheck source=/dev/null
  source "$dir"/../lib/homebrew.sh
fi

if ! type brew >/dev/null; then
  require_homebrew
fi

# dropbox is banned
# google-chrome, slack may be installed manually
# gcloud-cli and karabiner-element is installed in each script
packages=(arc cursor google-japanese-ime rancher visual-studio-code)
(
  set -x
  HOMEBREW_NO_INSTALL_UPGRADE=1 brew install --cask "${packages[@]}"
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
