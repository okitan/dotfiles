#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

(
  set -x
  brew install visual-studio-code
)

(
  set -x
  "$dir/../vscode/bootstrap.sh" "$HOME/Library/Application Support/Code/User"
)
