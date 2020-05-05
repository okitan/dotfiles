#!/bin/bash

set -eu

# do under osx directory
dir=$(dirname "$0")
(
  set -x

  # install xcode first
  xcode-select --install || true

  # TODO: remove later
  "$dir/homebrew/bootstrap.sh"
  "$dir/homebrew/common.sh"
)

# TODO: karabiner/bootstrap.sh should be */bootstrap.sh
for file in "${0%/*}"/{bootstrap/*.sh,karabiner/bootstrap.sh}; do
  (
    set -x
    echo $file
  )
done
