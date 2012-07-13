if respond_to nodebrew; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
    nodebrew use latest
fi
