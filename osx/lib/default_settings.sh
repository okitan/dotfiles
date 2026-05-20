# shellcheck shell=bash

##
# System Settings
##

# 一般
register_default 'UI mode' '.GlobalPreferences' 'AppleInterfaceStyle' 'string' 'Dark'

# デスクトップとスクリーンセーバー

# Dockとメニューバー
## Dock
register_default 'Dock orientation' 'com.apple.dock' 'orientation' 'string' 'bottom'
register_default 'Dock autohide' 'com.apple.dock' 'autohide' 'bool' 'true'
register_default 'Dock recents' 'com.apple.dock' 'show-recents' 'bool' 'false'

## Bluetooth
register_default 'ControlCenter Bluetooth' "$CONTROL_CENTER_PLIST" 'Bluetooth' 'int' '2'
## サウンド
register_default 'ControlCenter Sound' "$CONTROL_CENTER_PLIST" 'Sound' 'int' '2'
## おやすみモード
register_default 'ControlCenter DND' "$CONTROL_CENTER_PLIST" 'DoNotDisturb' 'int' '8'
## バッテリー
register_default 'Battery percentage' "$CONTROL_CENTER_PLIST" 'BatteryShowPercentage' 'bool' 'true'
### Spotlight
# TODO: メニューバーに表示しない

# Mission Control
register_default 'Mission Control enabled' 'com.apple.WindowManager' 'GloballyEnabled' 'bool' 'true'
register_default 'Mission Control seen' 'com.apple.WindowManager' 'GloballyEnabledEver' 'bool' 'true'

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
register_default 'Key repeat' 'NSGlobalDomain' 'KeyRepeat' 'int' '2'
register_default 'Initial key repeat' 'NSGlobalDomain' 'InitialKeyRepeat' 'int' '35'
## ユーザ辞書
register_default 'Auto capitalization' '.GlobalPreferences' 'NSAutomaticCapitalizationEnabled' 'bool' 'false'
register_default 'Auto period' '.GlobalPreferences' 'NSAutomaticPeriodSubstitutionEnabled' 'bool' 'false'
register_default 'Auto dash' '.GlobalPreferences' 'NSAutomaticDashSubstitutionEnabled' 'bool' 'false'
register_default 'Auto quote' '.GlobalPreferences' 'NSAutomaticQuoteSubstitutionEnabled' 'bool' 'false'
## 入力ソース
register_default 'Fn key usage' 'com.apple.HIToolbox' 'AppleFnUsageType' 'int' '0'
# TOOD: https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh#L983-L992

# トラックパッド
## ポイントとクリック
### TODO: 調べる&データ検出を無効化
## trackpad
register_default 'Trackpad corner click' 'com.apple.driver.AppleBluetoothMultitouch.trackpad' 'TrackpadCornerSecondaryClick' 'int' '2'
register_default 'Trackpad right click' 'com.apple.driver.AppleBluetoothMultitouch.trackpad' 'TrackpadRightClick' 'bool' 'false'
## その他のジェスチャ
### ページ間をスワイプ
register_default 'Swipe navigation' '.GlobalPreferences' 'AppleEnableSwipeNavigateWithScrolls' 'bool' 'false'

# マウス
register_default 'Mouse button mode' 'com.apple.driver.AppleBluetoothMultitouch.mouse' 'MouseButtonMode' 'string' 'TwoButton'

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
register_default 'Clock 24-hour' 'com.apple.menuextra.clock' 'Show24Hour' 'bool' 'true'
register_default 'Clock AM/PM' 'com.apple.menuextra.clock' 'ShowAMPM' 'bool' 'false'
register_default 'Clock date' 'com.apple.menuextra.clock' 'ShowDate' 'int' '1'
register_default 'Clock weekday' 'com.apple.menuextra.clock' 'ShowDayOfWeek' 'bool' 'true'

# finder
register_default 'Show all extensions' 'NSGlobalDomain' 'AppleShowAllExtensions' 'bool' 'true'
register_default 'Finder extensions' 'com.apple.finder' 'AppleShowAllExtensions' 'bool' 'true'
register_default 'Finder tabs' 'com.apple.finder' 'ShowTabView' 'bool' 'true'
register_default 'Finder target' 'com.apple.finder' 'NewWindowTarget' 'string' 'PfLo'
register_default 'Finder target path' 'com.apple.finder' 'NewWindowTargetPath' 'string' "file://${HOME}/Downloads/"
# TODO: side bar