if [[ -x /usr/local/bin/brew ]]; then
  export PATH="/usr/local/bin/:$PATH"
else
  if [[ -x /opt/homebrew/bin/brew ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
  else
    echo "You need to install homebrew"
    return
  fi
fi
