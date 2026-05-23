# okitan/dotfiles

## setup

Prerequisite: install Homebrew before running bootstrap.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/okitan/dotfiles/master/bootstrap.sh)"
```

`bootstrap.sh` does not install Homebrew itself. It assumes Homebrew is already installed and will fail with an explicit error if `brew` still cannot be resolved.

`lib/homebrew.sh` exists to load the Homebrew shell environment for the current shell process. This is separate from installing Homebrew itself.

The script includes:

- linking dotfiles
- installing oh-my-zsh
- installing Homebrew packages managed by this repo

## layout

- `bootstrap.sh`: top-level entrypoint that orchestrates the initial setup
- `bootstrap/*.sh`: executable setup phases invoked from `bootstrap.sh`
- `lib/*.sh`: internal shell helpers sourced by scripts, not executed directly
- `tools/*.sh`: manually-invoked utility scripts for maintenance and auditing
- `homebrew/*.sh`: Homebrew package installation scripts
- `osx/*.sh`: macOS-specific setup scripts
- `zsh/*.sh`: zsh startup snippets loaded from `.zshrc`

Enjoy!

### manual setup

See: [osx/README.md](./osx)
