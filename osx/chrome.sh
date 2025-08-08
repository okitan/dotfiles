#!/bin/bash

set -eu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! type load_homebrew >/dev/null; then
  # shellcheck source=/dev/null
  source "$dir"/../zsh/homebrew.sh
fi

if ! type brew >/dev/null; then
  (
    set -x
    "$dir"/../bootstrap/homebrew.sh
  )
  load_homebrew
fi

# google-chrome may be installed manually
if [[ ! -d "/Applications/Google Chrome.app" ]]; then
  (
    set -x
    brew install --cask google-chrome
  )
fi
