#!/bin/bash

set -eu

# install rvm
if ! type rvm >/dev/null; then
  (
    set -x
    # if this fails on OSX install gunupg by homebrew
    gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
      curl -sSL https://get.rvm.io | bash -s stable
  )
fi

# link rc
(
  cd "$(dirname "$0")" || (echo "cd failed" && exit 127)

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
