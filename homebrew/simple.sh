#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

packages=(ag awk curl direnv gnupg source-highlight tmux tree wget)
(
  set -x
  brew install "${packages[@]}" || brew upgrade "${packages[@]}"
)
