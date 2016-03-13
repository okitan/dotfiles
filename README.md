# okitan/dotfiles

## setup

```bash
# you need private key of github
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

# Env specific

## osx

See: [osx/README.md](./osx)
