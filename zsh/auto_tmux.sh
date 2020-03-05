function auto_tmux() {
    current_dir=$(basename "$(pwd)")
    
    not_attached_sessions=$(tmux ls 2>/dev/null | grep -v attached)
    if [[ -z "$not_attached_sessions" ]]; then
        tmux new-session -s "$current_dir"
    else
        found=$(print "$not_attached_sessions" | grep "$current_dir:")
        
        if [[ -n "$found" ]]; then
            tmux attach -t "$(print "$found" | head -n 1 | cut -d ":" -f 1)"
        else
            tmux attach -t "$(print "$not_attached_sessions" | head -n 1  | cut -d ":" -f 1)"
        fi
    fi
}

if respond_to tmux && [[ "$TMUX" = "" ]]; then
    auto_tmux
fi
