# USAGE
# echo "[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc" >> ~/.zshrc

# PATH

# LANG
export LANG=ja_JP.UTF-8

# ENVS
export EDITOR=vi

# PROMPT
PROMPT='%{$fg_bold[red]%}➜ '
RPROMPT='%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

# HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# FUNCTIONS
source ~/dotfiles/zsh/functions

# FIXME: use for
eval "`find ${0%/*}/zsh -name "*.sh" | sort | sed "s/^/load_zshrc /g"`"

# local settings
source_if_exist ~/.zshrc.secret
source_if_exist ~/dotfiles/.zshrc.local
