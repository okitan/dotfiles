file=/usr/local/bin/src-hilite-lesspipe.sh

if [[ -e $file ]]; then
    export LESS='-R'
    export LESSOPEN="| $file %s"
fi
