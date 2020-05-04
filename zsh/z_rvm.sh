# This should be done last (if not rvm complains of it)

if [[ -e ~/.rvm ]]; then
  # shellcheck source=/dev/null
  source ~/.rvm/scripts/rvm

  rvmnize() {
    echo "default" >.ruby-version
    basename "$(pwd)" >.ruby-gemset
    # reload
    cd .. && cd - || exit
  }
fi
