#!/bin/bash

set -eu

# needs awk
( set -x
  brew install jq || true
)

if [[ $(sw_vers -productVersion | awk -F'[.]' '{print $2}') > 11 ]]; then
  ( set -x
    brew cask install karabiner-elements
  )
else
  ( set -x
    brew cask install karabiner
  )
fi
