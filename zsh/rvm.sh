if [[ -e ~/.rvm ]]; then
  source ~/.rvm/scripts/rvm

  mkdir_rvm() {
    mkdir $1
    echo "default" > $1/.ruby-version
    echo $1        > $1/.ruby-gemset
    echo 'source "https://rubygems.org"' > $1/Gemfile
  }

  rvmnize() {
    echo "default" > .ruby-version
    basename `pwd` > .ruby-gemset
    cd ..
    cd -
  }
fi
