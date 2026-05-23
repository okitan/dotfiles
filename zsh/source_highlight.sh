if lesspipe_path="$(command -v src-hilite-lesspipe.sh 2>/dev/null)"; then
  export LESS='-R'
  export LESSOPEN="| $lesspipe_path %s"
else
  echo "You need: brew install source-highlight"
fi
