#!/bin/bash

set -eu

linuxbrew="/home/linuxbrew/.linuxbrew/bin"
if [[ "$(uname)" == "Linux" ]] && [[ "$PATH" != *"$linuxbrew"* ]]; then
  export PATH="$linuxbrew:$PATH"
fi

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
