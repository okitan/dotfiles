#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

(
  set -x

  brew install google-cloud-sdk
)

if [[ ! -s ~/.config/gcloud/access_tokens.db ]]; then
  (
    set -e
    gcloud auth login
  )
fi
