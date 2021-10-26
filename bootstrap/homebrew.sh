#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type load_homebrew >/dev/null; then
  source "$dir"/../zsh/homebrew.sh
fi

if ! type brew >/dev/null; then
  (
    set -x
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
  )

  # load PATH
  load_homebrew

  for file in "$dir"/../homebrew/*.sh; do
    (
      set -x
      $file
    )
  done
fi
