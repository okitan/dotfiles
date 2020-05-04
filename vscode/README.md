# vscode

Some editor settings can be changed in each env.

## apply change of settings.json

```console
$ ./apply.rb /path/to/settings.json
```

## backup change of settings.json

```console
$ ./backup.rb /path/to/settings.json
```

## path to settings.json

- Windows
  - %APPDATA%\Code\User\settings.json
- Mac
  - \$HOME/Library/Application Support/Code/User/settings.json
- Linux
  - \$HOME/.config/Code/User/settings.json
