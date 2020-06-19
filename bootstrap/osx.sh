#!/bin/bash

set -eu

if [[ "$(uname)" != "Darwin" ]]; then
  exit
fi

# Note: git should be installed by xcode-select --install

for file in "${0%/*}"/../osx/*.sh; do
  (
    set -x
    $file
  )
done
