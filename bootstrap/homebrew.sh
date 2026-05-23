#!/bin/bash

set -eu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! type load_homebrew >/dev/null; then
  # shellcheck source=/dev/null
  source "$dir"/../zsh/homebrew.sh
fi

for file in "$dir"/../homebrew/*.sh; do
  (
    set -x
    bash "$file"
  )
done

