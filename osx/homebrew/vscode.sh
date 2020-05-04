#!/usr/bin/env zsh

set -eu

(
  set -x
  # brew cask install visual-studio-code --appdir=/Applications
)

(
  cd "$(dirname $0)" || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  set -x
  ../../vscode/bootstrap.sh "$HOME/Library/Application Support/Code/User"
)
