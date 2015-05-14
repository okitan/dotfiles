cd ~

[[ -d dotfiles ]] || git clone git@github.com:okitan/dotfiles.git

# override dotfiles
targets=".bundle .emacs.d .gemrc .gitconfig .gitignore .pryrc .rspec .rvmrc .tmux.conf .vimrc"
for target in $targets; do
    [[ -e $target ]] && mv $target $target.old
    ln -s ~/dotfiles/$target ~
done

if [[ ! -d .oh-my-zsh ]]
   curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

   sed -i "" -e "s/^plugins=.*/plugins=\(brew cpanm gem git github osx perl rake ruby rvm\)/" .zshrc
   cat <<EOF >> .zshrc
# added by ~/dotfiles/bootstrap.sh
[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc

export LANG=ja_JP.UTF-8
EOF
fi

cd -
EOF
