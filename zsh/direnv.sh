if type direnv >/dev/null; then
  eval "$(direnv hook zsh)"
else
  echo "You need brew install direnv"
fi
