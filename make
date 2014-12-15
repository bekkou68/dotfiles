#!/bin/zsh

# Copy all dot.* files to home directory starts from '.'
for name in dot.*; do
  cp $name ~/${name#dot};
done

echo '* * * End copying dotfiles to home directory'

source ~/.zshrc

echo '* * * End source ~/.zshrc'

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo '* * * Now boot vim and do :BundleInstall'
