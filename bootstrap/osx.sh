#!/bin/bash

set -eu

if [[ "$(uname)" != "Darwin" ]]; then
  exit
fi

# install xcode first
xcode-select --install || true

for file in "${0%/*}"/../osx/*.sh; do
  (
    set -x
    $file
  )
done
