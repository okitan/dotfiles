# USAGE
# echo "[[ -f ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc" >> ~/.zshrc

# PROMPT
PROMPT='%{$fg_bold[red]%}➜ '
RPROMPT='%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

# HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

source ~/dotfiles/zsh/functions

# I don't know how to loop with each
eval "`find ${0%/*}/zsh -name "*.sh" | sed "s/^/load_zshrc /g"`"

# local settings
source_if_exist ~/dotfiles/.zshrc.local

# for nginx
alias sudo="sudo "
