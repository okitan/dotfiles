source `dirname $0`/function

IFS=$'\n'
for pkg in `cat <<EOF
hub
node
tig
EOF`
do
    brew_install_or_upgrade $pkg
done
