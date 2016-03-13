# usage

```bash
# for mac
curl https://raw.githubusercontent.com/okitan/dotfiles/master/osx/init.sh  | sh
# ssh key needed
curl https://raw.githubusercontent.com/okitan/dotfiles/master/bootstrap.sh | sh
```

The script includes
* links dotfiles
* install oh-my-zsh

After bootstrapping, You can install apps using homebrew.

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ homebrew/common.sh
```
