if [[ -x /usr/local/bin/src-hilite-lesspipe.sh ]]; then
  export LESS='-R'
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
else
  echo "You need: brew install source-highlight"
fi
