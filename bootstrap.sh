#!/bin/bash

set -eu

# install self
dir=~/dotfiles
if [[ ! -d $dir ]]; then
  (
    set -x
    git clone https://github.com/okitan/dotfiles.git $dir
  )
fi

# override dotfiles
targets=(.commit_template .gitconfig .gitignore .tmux.conf .vimrc)
for target in "${targets[@]}"; do
  # backup
  if [[ -d ~/"$target" && (! -L ~/"$target") ]]; then
    (
      set -x
      mv ~/"$target"{,.bak}
    )
  fi
  (
    set -x
    ln -sf "$dir/$target" ~
  )
done

# setup homebrew
(
  set -x
  bash "$dir"/bootstrap/homebrew.sh
)
# shellcheck source=/dev/null
source "$dir"/zsh/homebrew.sh
require_homebrew

# exec bootstrap
for file in "${dir}"/bootstrap/*.sh; do
  (
    set -x
    bash "$file"
  )
done

# further announcement
cat <<__EOF__
okitan/dotfiles setup complete

for more information See: README.md
__EOF__
