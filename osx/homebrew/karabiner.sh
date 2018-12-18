#!/bin/bash

set -eu

source $(dirname $0)/function

# needs awk
brew_install_or_upgrade awk

# these casks will update automatically
if [[ $(sw_vers -productVersion | awk -F'[.]' '{print $2}') > 11 ]]; then
  ( set -x
    brew cask install karabiner-elements
  )
else
  ( set -x
    brew cask install karabiner
  )
fi
