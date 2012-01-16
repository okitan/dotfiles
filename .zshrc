# USAGE
# echo "[[ -f ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc" >> ~/.zshrc

# PROMPT
PROMPT='%{$fg_bold[red]%}➜ '
RPROMPT='%{$reset_color%} %~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'

# load each zsh. each zshrc can be disabled by touching $file.orz
load_zshrc() {
  [[ -f $file ]] && ! [[ -e $file.orz ]] && source $file
}

files=`find ${0%/*}/zsh -name "*.sh"`
for file in $files; do
  load_zshrc $file
done

# local settings
[[ -f ~/dotfiles/.zshrc.local ]] && source ~/dotfiles/.zshrc.local
