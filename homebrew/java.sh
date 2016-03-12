source `dirname $0`/function.sh

IFS=$'\n'
for pkg in `cat <<EOF
maven
EOF`
do
    brew_install_or_upgrade $pkg
done

IFS=$'\n'
for pkg in `cat <<EOF
java
EOF`
do
    brew_cask_install $pkg
done
