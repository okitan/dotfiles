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

packages=(zsh)
(
  set -x
  brew install "${packages[@]}"
)

# chsh
shell=$(brew --prefix)/bin/zsh
if [[ "$SHELL" != "$shell" ]]; then
  if ! grep "$shell" /etc/shells >/dev/null; then
    (
      set -x
      echo "$shell" | sudo tee -a /etc/shells
    )
  fi
  (
    set -x
    chsh -s "$shell"
  )
fi
