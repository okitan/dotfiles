# brew install or upgrade
function brew_install_or_upgrade {
    IFS=' '
    module_with_options=`echo $*`

    brew install $module_with_options
    if [ $? ]; then
        brew upgrade $module_with_options
    fi
}

function brew_cleanup_all {
    brew cleanup
    brew cask cleanup
}
