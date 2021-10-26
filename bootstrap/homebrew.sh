#!/bin/bash

set -eu

if ! type load_homebrew >/dev/null; then
  source "${0%/*}"/../zsh/homebrew.sh
fi

if ! type brew >/dev/null; then
  (
    set -x
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
  )

  # load PATH
  load_homebrew

  for file in "${0%/*}"/../homebrew/*.sh; do
    (
      set -x
      $file
    )
  done
fi
