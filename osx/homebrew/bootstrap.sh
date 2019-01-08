#!/bin/bash

set -eu

# homebrew setup
( set -x
  [[ -x /usr/local/bin/brew ]] || \
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
)

( set -x
  # for app store See: https://github.com/mas-cli/mas
  [[ -x /usr/local/bin/mas ]] || \
    # <- for >= 10.13 / for < 10.13 ->
    brew install mas || brew install mas-cli/mas/mas
)

cat <<__EOF__
1. setup standard env
    homebrew/common.sh

2. after that install what you need
   homebrew/\${GROUP}.sh

GROUP are...
$(find $(dirname $0)/*.sh | grep -v bootstrap | xargs -I{} -L 1 basename {} .sh)
__EOF__
