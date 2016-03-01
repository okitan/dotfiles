source `dirname $0`/function.sh

IFS=$'\n'
for pkg in `cat <<EOF
android-sdk
EOF`
do
    brew_install_or_upgrade $pkg
done

IFS=$'\n'
for pkg in `cat <<EOF
EOF`
do
    brew_cask_install_or_upgrade $pkg
done
