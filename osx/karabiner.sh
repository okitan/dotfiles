#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 30
/bin/echo -n .
$cli set repeat.initial_wait 500
/bin/echo -n .
$cli set remap.commandR2commandR_commandSpace 1
/bin/echo -n .
$cli set remap.jis_unify_eisuu_to_kana 1
/bin/echo -n .
$cli set remap.space2shiftL_space_keyrepeat 1
/bin/echo -n .
$cli set remap.shiftL2commandL 1
/bin/echo -n .
$cli set remap.jis_eisuu2escape 1
/bin/echo -n .
/bin/echo
