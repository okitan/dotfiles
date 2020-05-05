#!/bin/bash

set -eu

# install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  (
    set -x
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  )
fi

# configure zshrc derived from oh-my-zsh
(
  set -x
  sed -i "" -e "s/^plugins=.*/plugins=\\(brew cpanm gem git github osx perl rake ruby rvm\\)/" ~/.zshrc
)

# inject local .zshrc
line_to_insert="[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc"
if ! grep "$line_to_insert" ~/.zshrc >/dev/null; then
  (
    set -x
    cat <<__EOF__ | tee -a ~/.zshrc >/dev/null

# load https://github.com/okitan/dotfiles
$line_to_insert
__EOF__
  )
fi
