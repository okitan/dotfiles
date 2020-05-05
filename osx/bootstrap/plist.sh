#!/bin/bash

set -eu

# mac settings (NSGlobalDomain can be replaced with -g)
## general
set_plist() {
  file=${HOME}/Library/Preferences/$1
  key=$2
  type=$3
  value=$4

  (
    set -x

    /usr/libexec/PlistBuddy -c "Add ${key} ${type} ${value}" "${file}" ||
      /usr/libexec/PlistBuddy -c "Set ${key}         ${value}" "${file}"
  )
}

# it does not work?
set_plist com.apple.recentitems.plist :RecentApplications:MaxAmount integer 0
set_plist com.apple.recentitems.plist :RecentDocuments:MaxAmount integer 0
set_plist com.apple.recentitems.plist :RecentServers:MaxAmount integer 0
