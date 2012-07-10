function auto_tmux() {
    not_attached_sessions=`tmux ls 2>/dev/null | grep -v attached`
    if [[ `print $not_attached_sessions | wc -l` -eq 0 ]]; then
        tmux
        tmux splitw -h
    else
        tmux attach -t `print $not_attached_sessions | head -n 1  | cut -d ":" -f 1`
    fi
}

if [[ "$TMUX" = "" ]];
    auto_tmux
fi
