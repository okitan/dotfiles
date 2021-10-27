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
  brew install --cask visual-studio-code
)

(
  set -x
  "$dir/../vscode/bootstrap.sh" "$HOME/Library/Application Support/Code/User"
)
