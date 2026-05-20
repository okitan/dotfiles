#!/bin/bash

set -eu

readonly CONTROL_CENTER_PLIST="$HOME/Library/Preferences/ByHost/com.apple.controlcenter.plist"

register_default() {
	local _label="$1"
	local domain="$2"
	local key="$3"
	local type="$4"
	local value="$5"

	(
		set -x
		defaults write "$domain" "$key" "-$type" "$value"
	)
}

source "${0%/*}/lib/default_settings.sh"

##
#  Reload
##
(
	set -x
	killall Dock
	killall SystemUIServer
)

cat <<-EOF
* システム設定 > ディスプレイ でスペースを拡大にする
EOF