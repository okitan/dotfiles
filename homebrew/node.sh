#!/bin/bash

set -eu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! type load_homebrew >/dev/null; then
  # shellcheck source=/dev/null
  source "$dir"/../zsh/homebrew.sh
fi

if ! type brew >/dev/null; then
  require_homebrew
fi

# separate because node is big
packages=(node@24 bun)
(
  set -x
  brew tap oven-sh/bun
  brew install "${packages[@]}"
)
