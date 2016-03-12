#!/usr/bin/env sh

# load brew_install_or_upgrade
source `dirname $0`/function.sh

IFS=$'\n'
for pkg in `cat <<EOF
ag
curl
git --without-completions
gpg
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

IFS=$'\n'
for pkg in `cat <<EOF
atom
dropbox
karabiner
google-chrome
google-japanese-ime
iterm2
EOF`
do
    brew_cask_install $pkg
done

# TODO:
# write how to setup Karabiner
