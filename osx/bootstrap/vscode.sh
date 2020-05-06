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
  brew cask install visual-studio-code --appdir=/Applications
)

(
  set -x
  "$dir/../../vscode/bootstrap.sh" "$HOME/Library/Application Support/Code/User"
)
