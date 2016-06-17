source `dirname $0`/function

IFS=$'\n'
for pkg in `cat <<EOF
chromedriver
phantomjs
EOF`
do
    brew_install_or_upgrade $pkg
done
