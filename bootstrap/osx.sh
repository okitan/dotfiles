#!/bin/bash

set -Eeu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$dir"/../lib/bootstrap.sh
bootstrap_setup_error_trap osx.sh

if [[ "$(uname)" != "Darwin" ]]; then
  exit
fi

# Note: git should be installed by xcode-select --install

for file in "$dir"/../osx/*.sh; do
  (
    set -x
    bash "$file"
  )
done
