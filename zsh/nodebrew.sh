export PATH=$HOME/.nodebrew/current/bin:$PATH

if respond_to nodebrew; then
    nodebrew use latest
fi
