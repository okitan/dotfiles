#!/bin/bash

set -eu

# do under osx directory
(cd "$(dirname "$0")" || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  # setup plist
  ./init.sh

  # install homebrew
  homebrew/bootstrap.sh
  homebrew/common.sh
)
