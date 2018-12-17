#!/bin/bash

set -eu

source $(dirname $0)/function

# they need additional configurations
( cd $(dirnma $0) || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  ./zsh.sh
  ./git.sh

  ./atom.sh
  ./karabiner.sh
)

IFS=$'\n'
for pkg in `cat <<EOF
ag
awk
curl
direnv
gpg
reattach-to-user-namespace
tmux
tree
wget
EOF`
do
  brew_install_or_upgrade $pkg
done

# these casks will update automatically
IFS=$'\n'
for pkg in `cat <<EOF
dropbox
google-chrome
google-japanese-ime
iterm2
EOF`
do
  HOMEBREW_CASK_OPTS="--appdir=/Applications" brew_cask_install $pkg
done

# more instructions
cat <<EOF
* dropbox
 * run, signin and choose which folders to sync
* karabiner
 * run karabiner
 * allow AXNotifier
 * run osx/karabiner.sh to configure
* karabiner-elements
 * TODO:
* google-chrome
 * run and make it default browser
* google-japanese-ime
 * run ConfigDialog from LaunchPad and reboot
 * open IME Configuration screen and add it
 * TODO: configuration script?
* iterm2
 * TODO: configuration script?
EOF
