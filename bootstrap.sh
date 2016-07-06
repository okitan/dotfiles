#/usr/bin/env sh

cd ~

[[ -d dotfiles ]] || git clone git@github.com:okitan/dotfiles.git

# override dotfiles
targets=".bundle .commit_template .emacs.d .gemrc .gitconfig .gitignore .pryrc .rspec .rvmrc .tmux.conf .vimrc"
for target in $targets; do
    [[ -e $target ]] && mv $target $target.old
    ln -s ~/dotfiles/$target ~
done

# zsh needs oh-my-zsh
if [[ ! -d .oh-my-zsh ]]; then
   curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

   sed -i "" -e "s/^plugins=.*/plugins=\(brew cpanm gem git github osx perl rake ruby rvm\)/" .zshrc
   cat <<EOF >> .zshrc
# added by ~/dotfiles/bootstrap.sh
[[ -e ~/dotfiles/.zshrc ]] && source ~/dotfiles/.zshrc
EOF

fi

cat <<EOF
okitan/dotfiles setup complete

when you use mac, install homebrew and follow instructions
   cd ~/dotfiles
   osx/homebrew/bootstrap.sh
EOF

cd -
