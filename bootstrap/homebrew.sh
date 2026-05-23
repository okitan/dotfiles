#!/bin/bash

set -Eeu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$dir"/../lib/bootstrap.sh
bootstrap_setup_error_trap homebrew.sh

if ! type load_homebrew >/dev/null; then
  # shellcheck source=/dev/null
  source "$dir"/../lib/homebrew.sh
fi

for file in "$dir"/../homebrew/*.sh; do
  (
    set -x
    bash "$file"
  )
done

