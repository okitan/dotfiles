#!/bin/bash

set -eu

# do under osx directory
dir=$(dirname "$0")
(
  set -x

  # install xcode first
  xcode-select --install || true

  # install homebrew
  "$dir/homebrew/bootstrap.sh"
  "$dir/homebrew/common.sh"
)

for file in "${0%/*}"/bootstrap/*.sh; do
  (
    set -x
    $file
  )
done
