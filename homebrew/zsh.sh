#!/bin/bash

set -eu

if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

(
  set -x
  brew install zsh || brew upgrade zsh
)

# chsh
shell=/usr/local/bin/zsh
if [[ "$SHELL" != $shell ]]; then
  if ! grep $shell /etc/shells >/dev/null; then
    (
      set -x
      echo $shell | sudo tee -a /etc/shells
    )
  fi
  (
    set -x
    chsh -s $shell
  )
fi
