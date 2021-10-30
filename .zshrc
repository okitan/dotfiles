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
## load each zsh. each zshrc can be disabled by touching $file.orz
load_zshrc() {
  [[ -f $1 ]] && ! [[ -e $1.orz ]] && source "$1"
}

# homebrew should be loaded first
load_zshrc "${0%/*}"/zsh/homebrew.sh
# load plugins
for file in "${0%/*}"/zsh/*.sh; do
  load_zshrc "$file"
done

# local settings
[[ -f ~/.zshrc.secret ]] && source ~/.zshrc.secret
[[ -f ~/dotfiles/.zshrc.local ]] && srouce ~/dotfiles/.zshrc.local
