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

(
  set -x

  brew install --cask karabiner-elements
)

(
  cd "$dir" || (echo "cd fails" && exit 127)

  set -x
  mkdir -p ~/.config/karabiner
  ln -sf "$(pwd)/karabiner.json" ~/.config/karabiner/karabiner.json
)
