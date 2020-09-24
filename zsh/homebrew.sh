# brew seems not in PATH and brew --prefix does not work...
if [[ "$(uname)" == "Linux" ]]; then
  dir="/home/linuxbrew/.linuxbrew/bin"
  if [[ ! -d "$dir" ]]; then
    echo "You need to install homebrew"
    return
  else
    export PATH="$dir:$PATH"
  fi
else
echo "there"
  dir="/usr/local/bin"
  if [[ ! -d "$dir" ]]; then
    echo "You need to install homebrew"
    return
  else
    export PATH="$dir:$PATH"
  fi
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

