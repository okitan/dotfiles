brew update

for arg in $*
do 
    if [[ -e homebrew/$arg.sh ]]; then
        sh homebrew/$arg.sh
    else
	echo "no homebrew/$arg.sh found"
    fi
done

brew cleanup
brew cask cleanup
