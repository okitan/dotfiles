#!/usr/bin/env sh

# load breq_install_or_upgrade
source `dirname $0`/function.sh

brew update

IFS=$'\n'
for pkg in `cat <<EOF
python3
zeromq
EOF`
do
    brew_install_or_upgrade $pkg
done

IFS=$'\n'
for pkg in `cat <<EOF
ipython
jinja2
tornado
pyzmq
jsonschema
EOF`
do
    pip3 install $pkg
done

brew cleanup
