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

# use homebrew with priority
line_to_insert='PATH="/usr/local/bin:$PATH"'
( set -x
    if ! grep "$line_to_insert" ~/.zshrc > /dev/null; then
      cat <<__EOF__ >> ~/.zshrc

$line_to_insert
__EOF__
    fi
)

( cd $(dirname $0) || (echo "cd failed" && exit 127)
  cat <<__EOF__
1. setup standard env
    homebrew/common.sh

2. after that install what you need
   homebrew/\${GROUP}.sh

GROUP are...
$(find *.sh | grep -v bootstrap | xargs -I{} -L 1 basename {} .sh)
__EOF__
)
