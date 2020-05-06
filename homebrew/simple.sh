#!/bin/bash

set -eu

if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

packages=(ag awk curl direnv gpg tmux tree wget)
(
  set -x
  brew install "${packages[@]}" || brew upgrade "${packages[@]}"
)
