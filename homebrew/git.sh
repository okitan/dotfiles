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

packages=(git git-delta tig hub)
(
  set -x
  brew install "${packages[@]}"

  # I think export PATH="$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight" seems also good
  ln -sf "$(brew --prefix git)/share/git-core/contrib/diff-highlight/diff-highlight" "$(brew --prefix)/bin/diff-highlight"
)
