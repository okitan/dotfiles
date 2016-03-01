source `dirname $0`/function.sh

IFS=$'\n'
for pkg in `cat <<EOF
node
EOF`
do
    brew_install_or_upgrade $pkg
done
