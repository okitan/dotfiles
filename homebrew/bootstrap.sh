#!/usr/bin/env sh

# homebrew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# plugins
brew tap caskroom/cask

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
