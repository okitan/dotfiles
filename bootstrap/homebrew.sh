#!/bin/bash

set -eu

if ! type brew >/dev/null; then
  (
    set -x
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
  )
fi

for file in "${0%/*}"/../homebrew/*.sh; do
  (
    set -x
    $file
  )
done
