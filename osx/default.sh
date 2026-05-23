#!/bin/bash

set -eu

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# shellcheck source=./osx/lib/default_settings.sh
source "$dir"/lib/default_settings.sh

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