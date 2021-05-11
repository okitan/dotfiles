#!/bin/bash

set -eu

dir=$(dirname "$0")
if ! type brew >/dev/null; then
  "$dir/../bootstrap/homebrew.sh"
fi

packages=(git git-delta tig hub)
(
  set -x
  brew install "${packages[@]}" || brew upgrade "${packages[@]}"

  # I think export PATH="$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight" seems also good
  ln -sf "$(brew --prefix git)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
)
