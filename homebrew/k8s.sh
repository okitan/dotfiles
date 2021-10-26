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

packages=(kubernetes-cli)
(
  set -x
  brew install "${packages[@]}"
)

# TODO: with gcp
