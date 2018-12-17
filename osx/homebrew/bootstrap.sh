#!/bin/bash

set -xu

# homebrew setup
( set -x
  [[ -x /usr/bin/local/brew ]] || \
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
)

( set -x
  # for app store See: https://github.com/mas-cli/mas
  # <- for >= 10.13 / for < 10.13 ->
  brew install mas || brew install mas-cli/mas/mas
)

# use homebrew with priority
line_to_insert='PATH="/usr/local/bin:$PATH"'
( set -x
    if ! grep "$line_to_insert" .zshrc > /dev/null; then
      cat <<__EOF__ >> .zshrc

    $line_to_insert
__EOF__
)

# install commons
( cd ($dirname $0) || || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  ./common.sh
)

cat <<EOF
0. setup cask installation pass
    ln -s ~/dotfiles/.zshrc.mac ~/dotfiles/.zshrc.local
    exit

1. setup standard env
    homebrew/common.sh

2. after that install what you need
   homebrew/install.sh *GROUP

GROUP are now
* dev
* emacs
* java
* notebook
 * this should be done in docker...
* selenium

TODO: docker
EOF
