#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  (
    set -x
    "$dir"/../bootstrap/homebrew.sh
  )
  source "$dir"/../zsh/bootstrap.sh
fi

packages=(git git-delta tig hub)
(
  set -x
  brew install "${packages[@]}"

  # I think export PATH="$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight" seems also good
  ln -sf "$(brew --prefix git)/share/git-core/contrib/diff-highlight/diff-highlight" "$(brew --prefix)/bin/diff-highlight"
)
