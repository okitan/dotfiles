#!/bin/sh

# get init-loader
if ! [[ -f elisp/init-loader.el ]] ; then
    wget "http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el?format=txt" -O elisp/init-loader.el
    emacs -batch -f batch-byte-compile elisp/init-loader.el
fi

# byte-compile inits
emacs -batch -f batch-byte-compile inits/*.el
