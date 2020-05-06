if ! type direnv >/dev/null; then
  echo "You need brew install direnv"
  eval "$(direnv hook zsh)"
fi
