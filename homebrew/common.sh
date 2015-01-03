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
reattach-to-user-namespace
source-highlight
tmux
tree
wget
zsh
EOF`
do
    brew_install_or_upgrade $pkg
done

# git diff-highlight
ln -sf `brew --prefix git`/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

brew cleanup
