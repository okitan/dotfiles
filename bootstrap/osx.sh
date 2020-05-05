#!/bin/bash

set -eu

if [[ "$(uname)" != "Darwin" ]]; then
  exit
fi

dir=$(dirname "$0")
(
  set -x
  "$dir/../osx/bootstrap.sh"
)
