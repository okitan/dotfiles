#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

(
  set -x

  brew cask install karabiner-elements --appdir=/Applications
)

(
  cd "$dir" || (echo "cd fails" && exit 127)

  set -x
  mkdir -p ~/.config/karabiner
  ln -sf "$(pwd)/karabiner.json" ~/.config/karabiner/karabiner.json
)
