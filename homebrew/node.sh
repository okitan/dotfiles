#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  (
    set -x
    "$dir"/../bootstrap/homebrew.sh
  )
  source "$dir"/../zsh/bootstrap.sh

fi

# separate because node is big
packages=(node deno)
(
  set -x
  brew install "${packages[@]}"
)
