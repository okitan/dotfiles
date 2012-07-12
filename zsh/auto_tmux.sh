function auto_tmux() {
    not_attached_sessions=`tmux ls 2>/dev/null | grep -v attached`
    if [[ `print $not_attached_sessions | wc -l` -le 1 ]]; then
        tmux
    else
        session=`print $not_attached_sessions | head -n 1  | cut -d ":" -f 1`
        if [[ "$session" != "" ]]; then
            tmux attach -t $session
        else
            echo $not_attached_sessions
            echo $session
        fi
    fi
}

if respond_to tmux && [[ "$TMUX" = "" ]]; then
    auto_tmux
fi
