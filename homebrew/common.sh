#!/usr/bin/env sh

# load breq_install_or_upgrade
source `dirname $0`/function.sh

brew update

IFS=$'\n'
for pkg in `cat <<EOF
ag
brew-cask
emacs --cocoa
git   --without-completions
hub
reattach-to-user-namespace
tig
tmux
tree
wget
zsh
EOF`
do
    brew_install_or_upgrade $pkg
done

brew cleanup-installed
