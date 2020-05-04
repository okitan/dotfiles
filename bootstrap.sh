#!/bin/bash

set -eu

# do in subshell
(
  cd ~ || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  # install self
  dir=~/dotfiles
  if [[ ! -d $dir ]]; then
    (
      set -x
      git clone git@github.com:okitan/dotfiles.git
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

  # install oh-my-zsh
  if [[ ! -d .oh-my-zsh ]]; then
    (
      set -x
      curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

      # FIXME: maybe something weired
      sed -i "" -e "s/^plugins=.*/plugins=\\(brew cpanm gem git github osx perl rake ruby rvm\\)/" .zshrc
    )
  fi

  # after installing oh-my-zsh inject local .zshrc
  line_to_insert="[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc"
  if ! grep "$line_to_insert" .zshrc >/dev/null; then
    (
      set -x
      cat <<__EOF__ | tee -a .zshrc >/dev/null

# load https://github.com/okitan/dotfiles
$line_to_insert
__EOF__
    )
  fi
)

# further announcement
cat <<__EOF__
okitan/dotfiles setup complete

for more information See: README.md
__EOF__
