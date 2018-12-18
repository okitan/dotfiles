#!/bin/bash

set -eu

brew cask install atom --appdir=/Applications

(cd $(dirname $0) || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  ../../atom/bootstrap.sh
)
