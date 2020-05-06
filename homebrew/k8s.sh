#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

(
  set -x
  brew install kubernetes-cli || brew upgrade kubernetes-cli
)

# TODO: with gcp
