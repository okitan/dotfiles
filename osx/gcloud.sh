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

(
  set -x

  brew install --cask google-cloud-sdk
)

if [[ ! -s ~/.config/gcloud/access_tokens.db ]]; then
  (
    set -e
    gcloud auth login
  )
fi
