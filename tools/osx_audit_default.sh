#!/bin/bash

set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

readonly CONTROL_CENTER_PLIST="$HOME/Library/Preferences/ByHost/com.apple.controlcenter.plist"

normalize_value() {
  local type="$1"
  local value="$2"

  if [[ "$type" != 'bool' ]]; then
    printf '%s' "$value"
    return
  fi

  case "$value" in
    1|true|TRUE)
      printf 'true'
      ;;
    0|false|FALSE)
      printf 'false'
      ;;
    *)
      printf '%s' "$value"
      ;;
  esac
}

read_default() {
  local domain="$1"
  local key="$2"

  if ! defaults read "$domain" "$key" >/dev/null 2>&1; then
    return 1
  fi

  defaults read "$domain" "$key" 2>/dev/null | tr -d '\n'
}

print_result() {
  local label="$1"
  local domain="$2"
  local key="$3"
  local type="$4"
  local expected="$5"
  local current
  local normalized_current
  local normalized_expected
  local status

  if current="$(read_default "$domain" "$key")"; then
    normalized_current="$(normalize_value "$type" "$current")"
    normalized_expected="$(normalize_value "$type" "$expected")"

    if [[ "$normalized_current" == "$normalized_expected" ]]; then
      status="OK"
    else
      status="DIFF"
    fi
  else
    normalized_current="(missing)"
    normalized_expected="$(normalize_value "$type" "$expected")"
    status="MISSING"
  fi

  printf '%-7s | %-30s | expected=%-24s | current=%s\n' \
    "$status" "$label" "$normalized_expected" "$normalized_current"
}

register_default() {
  print_result "$@"
}

printf 'Comparing current macOS defaults with osx/default.sh expectations\n'
printf 'Host-specific plist: %s\n\n' "$CONTROL_CENTER_PLIST"

# shellcheck source=./osx/lib/default_settings.sh
source "$dir"/../osx/lib/default_settings.sh