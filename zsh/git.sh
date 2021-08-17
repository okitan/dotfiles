if type git >/dev/null; then
  alias diff="git diff --no-index"
else
  echo "You need brew install git"
fi
