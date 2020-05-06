if [[ ! -d /usr/local/bin ]]; then
  echo "You need to install homebrew"
  return
fi

export PATH="/usr/local/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
