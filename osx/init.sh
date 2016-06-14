#!/bin/sh

xcode-select --install

# mac settings (NSGlobalDomain can be replaced with -g)
## general
function set_plist() {
    file=${HOME}/Library/Preferences/$1
    key=$2
    type=$3
    value=$4

    /usr/libexec/PlistBuddy -c "Add ${key} ${type} ${value}" ${file} \
||  /usr/libexec/PlistBuddy -c "Set ${key}         ${value}" ${file}
}

# it does not work?
set_plist com.apple.recentitems.plist :RecentApplications:MaxAmount integer 0
set_plist com.apple.recentitems.plist :RecentDocuments:MaxAmount    integer 0
set_plist com.apple.recentitems.plist :RecentServers:MaxAmount      integer 0

## spotlight
# TODO:

## keyboard
defaults write NSGlobalDomain KeyRepeat        -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 35

## mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

## trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int  2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick           -bool false

# application settings
## menu bar
defaults write com.apple.menuextra.clock DateFormat -string "M\U6708d\U65e5(EEE)  H:mm"

## finder
defaults write NSGlobalDomain   AppleShowAllExtensions -bool   true
defaults write com.apple.finder AppleShowAllExtensions -bool   true
defaults write com.apple.finder ShowTabView            -bool   true
defaults write com.apple.finder NewWindowTarget        -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath    -string "file://${HOME}/Downloads/"
# TODO: side bar

## dock
defaults write com.apple.dock autohide    -bool   true
defaults write com.apple.dock orientation -string "left"

# reload
killall Dock
killall SystemUIServer

# more instructions
cat <<EOF
1. set ssh key for github

2. run bootstrap.sh
    curl https://raw.githubusercontent.com/okitan/dotfiles/master/bootstrap.sh | sh
EOF
