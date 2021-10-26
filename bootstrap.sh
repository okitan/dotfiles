#!/bin/bash

set -eu

# install self
dir=~/dotfiles
if [[ ! -d $dir ]]; then
  (
    set -x
    git clone git@github.com:okitan/dotfiles.git $dir
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
  ~/dotfiles/bootstrap/homebrew.sh
  source ~/dotfiles/zsh/homebrew.sh
)

# exec bootstrap
for file in "${dir}"/bootstrap/*.sh; do
  (
    set -x
    $file
  )
done

# further announcement
cat <<__EOF__
okitan/dotfiles setup complete

for more information See: README.md
__EOF__
