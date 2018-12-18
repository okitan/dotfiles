#!/bin/bash

set -eu

source $(dirname $0)/function

brew_install_or_upgrade emacs --cocoa
