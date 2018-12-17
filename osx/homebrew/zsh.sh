#!/bin/bash

set -eu

source $(dirname $0)/function

brew_install_or_upgrade zsh

( set -x
  chsh -s /usr/local/bin/zsh
)
