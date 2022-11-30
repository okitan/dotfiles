#!/bin/bash

set -eux

##
# System Settings
##

# 一般
## 外観モード
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"

# デスクトップとスクリーンセーバー

# Dockとメニューバー
## Dock
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

## Bluetooth
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 2
## サウンド
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 2
## おやすみモード
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist DoNotDisturb -int 8
## バッテリー
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true
### Spotlight
# TODO: メニューバーに表示しない

# Mission Control

# Siri

# Spotlight
# TODO: Macintosh HDを除外

# 言語と地域

# 通知
# TODO: 不要なやつを切る

# インターネットアカウント

# Walletとアップルペイ

# Touch ID
# TODO: 登録する

# ユーザとグループ
# TODO: ログインスクリーンのアイコンを変更する

# アクセシビリティ

# スクリーンタイム

# 機能拡張

# セキュリティとプライバシー

# ソフトウェアアップデート

# ネットワーク

# Bluetooth

# サウンド
# Do in Dockとメニューバー

# プリンタとスキャナ

# キーボード
## キーボード
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 35
# ユーザ辞書
defaults write .GlobalPreferences NSAutomaticCapitalizationEnabled -bool false
defaults write .GlobalPreferences NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool false
defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool false
## 入力ソース
# TOOD: https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh#L983-L992

# トラックパッド
## ポイントとクリック
### TODO: 調べる&データ検出を無効化
## trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false

## その他のジェスチャ
### ページ間をスワイプ
# defaults write .GlobalPreferences AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write ~/Library/Preferences/ByHost/.GlobalPreferences com.apple.trackpad.threeFingerHorizSwipeGesture -int 1

# マウス
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# ディスプレイ
## ディスプレイ
## TODO: スペースを拡大に変更

# バッテリー

# 日付と時刻

# 共有

# Time Machine

# 起動ディスク

# プロファイル

# application settings

##
# Application Settings
##

# menu bar
defaults write com.apple.menuextra.clock DateFormat -string "M\U6708d\U65e5(EEE)  H:mm"

# finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"
# TODO: side bar

##
#  Reload
##
killall Dock
killall SystemUIServer
