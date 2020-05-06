#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

packages=(kubernetes-cli)
(
  set -x
  brew install "${packages[@]}" || brew upgrade "${packages[@]}"
)

# TODO: with gcp
