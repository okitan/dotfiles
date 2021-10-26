#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

packages=(zsh)
(
  set -x
  brew install "${packages[@]}"
)

# chsh
shell=$(brew --prefix)/bin/zsh
if [[ "$SHELL" != "$shell" ]]; then
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
