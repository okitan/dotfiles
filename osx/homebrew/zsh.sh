#!/bin/bash

set -eu

source $(dirname $0)/function

brew_install_or_upgrade zsh

# chsh
shell=/usr/local/bin/zsh
( set -x
  if ! grep $shell /etc/shells; then
    sudo tee -a /etc/shells <<< $shell
  fi
  chsh -s $shell
)
