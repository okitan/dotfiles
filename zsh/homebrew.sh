load_homebrew() {
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    if [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    else
      echo "no homebrew installed"
    fi
  fi
}

require_homebrew() {
  if type brew >/dev/null; then
    return 0
  fi

  cat >&2 <<'__EOF__'
Homebrew is required but not installed.

Install it first:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Then rerun bootstrap:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/okitan/dotfiles/master/bootstrap.sh)"
__EOF__
  return 1
}

load_homebrew
