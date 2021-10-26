if [[ ! -d /usr/local/bin ]]; then
  echo "You need to install homebrew"
  return
fi

export PATH="/usr/local/bin:$PATH"
