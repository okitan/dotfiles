# install to /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:$PATH"

  brew_install_or_upgrade() {
    IFS=' '
    module_with_options=$(echo $*)

    if ! brew install $module_with_options; then
      brew upgrade $module_with_options
    fi
  }
fi
