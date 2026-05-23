#!/bin/bash

set -Eeu

# install self
dir=~/dotfiles

if [[ ! -d $dir ]]; then
  (
    set -x
    git clone https://github.com/okitan/dotfiles.git "$dir"
  )
fi

# shellcheck source=/dev/null
source "$dir"/lib/bootstrap.sh
bootstrap_setup_error_trap bootstrap.sh

# override dotfiles
targets=(.commit_template .gitconfig .gitignore .tmux.conf .vimrc)

target_index=0
for target in "${targets[@]}"; do
  target_index=$((target_index + 1))

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

(
  set -x
  bash "$dir"/bootstrap/homebrew.sh
)

# shellcheck source=/dev/null
source "$dir"/lib/homebrew.sh
require_homebrew

for file in "$dir"/bootstrap/*.sh; do
  case "$(basename "$file")" in
    homebrew.sh)
      continue
      ;;
  esac

  (
    set -x
    bash "$file"
  )
done

cat <<__EOF__
okitan/dotfiles setup complete

for more information See: README.md
__EOF__
