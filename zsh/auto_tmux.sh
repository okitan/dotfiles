# Usage:
# echo "[[ -f ~/dotfiles/zsh/auto_tmux.sh ]] && source ~/dotfiles/zsh/auto_tmux.sh" >> ~/.zshrc

function auto_tmux() {
  if [[ `tmux ls 2>/dev/null | grep -v attached | wc -l` -eq 0 ]]; then
    tmux
  else
    tmux attach
  fi
}

auto_tmux