# USAGE
# echo "[[ -f ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc" >> ~/.zshrc

# PROMPT
PROMPT='%{$fg_bold[red]%}➜ '
RPROMPT='%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

# load each zsh. each zshrc can be disabled by touching $file.orz
load_zshrc() {
  [[ -f $1 ]] && ! [[ -e $1.orz ]] && source $1
}

# I don't know how to loop with each
eval "`find ${0%/*}/zsh -name "*.sh" | sed "s/^/load_zshrc /g"`"

# local settings
[[ -f ~/dotfiles/.zshrc.local ]] && source ~/dotfiles/.zshrc.local
