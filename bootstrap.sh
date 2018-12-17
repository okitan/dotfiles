#!/bin/bash

set -eu

# do in subshell
(cd ~ || (echo "cd fails" && exit 127)
  echo "Now I'm on $(pwd)"

  # install self
  dir=~/dotfiles
  ( set -x
    [[ -d $dir ]] || git clone git@github.com:okitan/dotfiles.git
  )

  # override dotfiles
  targets=".commit_template .emacs.d .gemrc .gitconfig .gitignore .tmux.conf .vimrc"
  for target in $targets; do
    ( set -x
      [[ -e "$target" && (! -L "$target") ]] && mv "$target"{,.bak}
      ln -sf "$dir"/"$target" ~
    )
  done

  # install oh-my-zsh
  if [[ ! -d .oh-my-zsh ]]; then
    ( set -x
      curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

      sed -i "" -e "s/^plugins=.*/plugins=\\(brew cpanm gem git github osx perl rake ruby rvm\\)/" .zshrc
    )
  fi

  # after installing oh-my-zsh inject local .zshrc
  line_to_insert="[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc"
  ( set -x
    if ! grep "$line_to_insert" .zshrc > /dev/null; then
      cat <<__EOF__ >> .zshrc

# load https://github.com/okitan/dotfiles
$line_to_insert
__EOF__
    fi
  )
)

# further announcement
  cat <<__EOF__
okitan/dotfiles setup complete

for more information See: README.md
__EOF__
