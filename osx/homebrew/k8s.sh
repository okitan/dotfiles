#!/bin/bash

set -eu

source $(dirname $0)/function

# docker
# these casks will update automatically
brew cask install docker --appdir=/Applications

# k8s
brew_install_or_upgrade kubernetes-cli
brew_install_or_upgrade skaffold
