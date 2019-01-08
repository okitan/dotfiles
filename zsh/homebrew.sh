# install to /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:$PATH"
fi
