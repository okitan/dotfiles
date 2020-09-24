#!/bin/bash

set -eu

if [[ "$(uname)" != "Linux" ]]; then
  exit
fi

sudo apt install language-pack-ja
