#!/bin/bash

set -eu

dir=$(dirname "$0")
if [[ ! -x /usr/local/bin/brew ]]; then
  (
    set -x
    "$dir/../../bootstrap/homebrew.sh"
  )
fi

(
  set -x

  brew cask install karabiner-elements
)

(
  cd "$dir" || (echo "cd fails" && exit 127)

  set -x
  ln -sf "$(pwd)/../karabiner.json" ~/.config/karabiner
)
