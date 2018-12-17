#/bin/bash

set -eu

# install rvm
( set -x
  if ! type rvm; then
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
      curl -sSL https://get.rvm.io | bash -s stable
  fi
)

# link rvmrc
(cd $(dirname $0) || (echo "cd failed" && exit 127)
  set -x
  [[ -d ~/.rvmrc && (! -L ~/.rvmrc ) ]] && mv ~/.rvmrc{,.bak}
  ln -sf $(pwd)/.rvmrc ~
)
