#!/bin/bash

set -eux

## spotlight
# TODO:

## keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 35

## mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

## trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false

# application settings
## menu bar
defaults write com.apple.menuextra.clock DateFormat -string "M\U6708d\U65e5(EEE)  H:mm"

## finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"
# TODO: side bar

## dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "left"

# reload
killall Dock
killall SystemUIServer
