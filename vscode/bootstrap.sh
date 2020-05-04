#!/usr/bin/env zsh

set -eu

VSCODE_SETTING_DIR=$1
VSCODE_SETTING_FILE=$1/settings.json

# make backup
if [[ -e "$VSCODE_SETTING_FILE" ]]; then
  (
    set -x
    cp "$VSCODE_SETTING_FILE" "$VSCODE_SETTING_FILE".bak
  )
fi

(
  cd "$(dirname "$0")" || (echo "cd fails" && exit 127)

  set -x
  ./apply.rb "$VSCODE_SETTING_FILE"
)
