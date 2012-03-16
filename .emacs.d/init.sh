#!/bin/sh

# get auto-install
if ! [[ -f elisp/auto-install.el ]] ; then
    wget http://www.emacswiki.org/emacs/download/auto-install.el -O elisp/auto-install.el
    emacs -batch -f batch-byte-compile elisp/auto-install.el
fi

# get init-loader
if ! [[ -f elisp/init-loader.el ]] ; then
    wget "http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el?format=txt" -O elisp/init-loader.el
    emacs -batch -f batch-byte-compile elisp/init-loader.el
fi

# get elpa
if ! [[ -f elisp/package.el ]]; then
    wget http://bit.ly/pkg-el23 -O elisp/package.el
    emacs -batch -f batch-byte-compile elisp/package.el
fi

# byte-compile inits
emacs -batch -f batch-byte-compile inits/*.el