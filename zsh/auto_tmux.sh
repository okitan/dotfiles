function new_tmux() {
    tmux new-session -s "$(basename "$(pwd)")"
}

function auto_tmux() {
    not_attached_sessions=$(tmux ls 2>/dev/null | grep -v attached)
    if [[ -z "$not_attached_sessions" ]]; then
        new_tmux
    else
        found=$(print "$not_attached_sessions" | grep "$(basename "$(pwd)"):")
        
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
