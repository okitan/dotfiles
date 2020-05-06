if ! type tmux >/dev/null; then
  echo "You need brew install tmux"
  return
fi

auto_tmux() {
  not_attached_sessions=$(tmux ls 2>/dev/null | grep -v attached)
  if [[ -z "$not_attached_sessions" ]]; then
    new_tmux
  else
    found=$(print "$not_attached_sessions" | grep "$(_tmux_session_name):")

    if [[ -n "$found" ]]; then
      tmux attach -t "$(print "$found" | head -n 1 | cut -d ":" -f 1)"
    else
      new_tmux
    fi
  fi
}

new_tmux() {
  tmux new-session -s "$(_tmux_session_name)"
}

_tmux_session_name() {
  if [[ "$(pwd)" = "$HOME" ]]; then
    echo "home"
  else
    basename "$(pwd)"
  fi
}

if [[ -z "$TMUX" ]]; then
  auto_tmux
fi
