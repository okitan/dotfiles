#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

# separate because node is big
packages=(node deno)
(
  set -x
  brew install "${packages[@]}"
)
