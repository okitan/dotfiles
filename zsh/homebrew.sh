load_homebrew() {
  if [[ -x /usr/local/bin/brew && $(echo "$PATH" | grep /usr/local/bin) ]]; then
    export PATH="/usr/local/bin:$PATH"
    return true
  else
    if [[ -x /opt/homebrew/bin/brew && $(echo "$PATH" | grep /opt/homebrew/bin) ]]; then
      export PATH="/opt/homebrew/bin:$PATH"
      return true
    else
      return false
    fi
  fi
}

load_homebrew
