#!/bin/bash

set -eu

dir=$(dirname "$0")
# install rvm
if ! type rvm >/dev/null; then
  # install gpg to verify rvm installation package
  if ! type gpg >/dev/null; then
    if ! type brew >/dev/null; then
      "$dir/../bootstrap/homebrew.sh"
    fi

    (
      set -x
      brew install gnupg || brew upgrade gnupg
    )
  fi

  (
    set -x
    gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
      curl -sSL https://get.rvm.io | bash -s stable
  )
fi

# link rc
(
  cd "$dir" || (echo "cd failed" && exit 127)

  pwd=$(pwd)
  targets=(.bundle .gemrc .pryrc .rspec .rvmrc)
  for target in "${targets[@]}"; do
    # backup
    if [[ -d ~/"$target" && (! -L ~/"$target") ]]; then
      (
        set -x
        mv ~/"$target"{,.bak}
      )
    fi
    (
      set -x
      ln -sf "$pwd/$target" ~
    )
  done
)
