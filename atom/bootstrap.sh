#!/bin/bash

# install plugins
( set -x
  apm install --packages-file ~/dotfiles/atom/Atomfile
)

# link plugin settings
( set -x
  [[ -e ~/.atom/config.cson && (! -L ~/.atom/config.cson) ]] && mv ~/.atom/config.cson{,.bak}
  ln -sf ~/dotfiles/atom/config.cson ~/.atom/
)
