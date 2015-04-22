#!/usr/bin/env sh

# load breq_install_or_upgrade
source `dirname $0`/function.sh

brew update

IFS=$'\n'
for pkg in `cat <<EOF
chromedriver
phantomjs
EOF`
do
    brew_install_or_upgrade $pkg
done

brew_cleanup_all
