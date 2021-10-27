load_homebrew() {
  if [[ -x /usr/local/bin/brew ]]; then
    if ! echo "$PATH" | grep -q /usr/local/bina; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    if [[ -x /opt/homebrew/bin/brew ]]; then
      if ! echo "$PATH" | grep -q /opt/homebrew/bin; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    else
      echo "no homebrew installed"
    fi
  fi
}

load_homebrew
