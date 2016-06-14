# OSX

## Before Bootstrapping

Run commands to prepare bootstrap and configure osx appearance.

```bash
osx/init.sh
```

## After Bootstrapping

### zsh

```bash
ln -s ~/dotfiles/osx/.zshrc.local ~/dotfiles/
```

### homebrew management

#### setup

`.zshr.local` defines path to install homebrew cask.  Run above zsh configuration before this.

```bash
osx/homebrew/bootstrap.sh
```

#### install Formulas

```bash
osx/homebrew/install.sh common emacs
```

### karabiner

After install by `osx/homebrew/common.sh`.
Run Karabiner and accept permissions and do below.

```bash
osx/karabiner.sh
```
