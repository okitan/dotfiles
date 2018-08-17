source `dirname $0`/function

IFS=$'\n'
for pkg in `cat <<EOF
docker
EOF`
do
    brew_cask_install $pkg
done
