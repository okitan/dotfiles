eval "$(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)"

if [[ -f ~/perl5/perlbrew/etc/bashrc ]]; then
  # shellcheck source=/dev/null
  source ~/perl5/perlbrew/etc/bashrc
fi
