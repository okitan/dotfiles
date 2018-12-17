#!/bin/bash

set -eu

source $(dirname $0)/function

brew_install_or_upgrade git --without-completions
brew_install_or_upgrade source-highlight

( set -x
  ln -sf $(brew --prefix git)/share/git-core/contrib/diff-highlight/diff-highlight \
         /usr/local/bin/diff-highlight
)
