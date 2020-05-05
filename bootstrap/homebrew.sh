#!/bin/bash

set -eu

if [[ ! -x /usr/local/bin/brew ]]; then
  (
    set -x
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
  )
fi

# after homebrew bootstraped load zshrc of homebrew

dir=$(dirname "$0")
(
  set -x
  # shellcheck source=/dev/null
  source "$dir/../zsh/homebrew.sh"
)
