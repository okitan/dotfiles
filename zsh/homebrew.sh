load_homebrew() {
  if [[ -x /usr/local/bin/brew ]] && echo "$PATH" | grep -q /usr/local/bin; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    if [[ -x /opt/homebrew/bin/brew ]] && echo "$PATH" | grep -q /opt/homebrew/bin; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      echo "no homebrew installed"
    fi
  fi
}

load_homebrew
