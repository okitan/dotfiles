# brew install or upgrade
function brew_install_or_upgrade {
    brew install $*
    if [ $? ]; then
        brew upgrade $*
    fi
}
