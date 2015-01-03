#!/usr/bin/env sh

# load breq_install_or_upgrade
source `dirname $0`/function.sh

brew update

brew_install_or_upgrade mkvtoolnix

brew cleanup
