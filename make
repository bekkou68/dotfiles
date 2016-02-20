#!/bin/zsh

echo '* * * Start copying dotfiles to home directory'
# Copy all dot.* files to home directory starts from '.'
for name in dot.*; do
  cp $name ~/${name#dot};
done
echo '* * * End copying dotfiles to home directory'
echo ''

echo '* * * Start source ~/.zshrc'
source ~/.zshrc
echo '* * * End source ~/.zshrc'
echo ''

echo '* * * Start setting up Vundle'
vundledir=~/.vim/bundle/Vundle.vim
if [ -e $vundledir ]; then
  echo '* * * * * * Repository already exists'
else
  echo '* * * * * * Repository not exists'
  echo '* * * * * * Start cloning Vundle'
  git clone https://github.com/VundleVim/Vundle.vim.git $vundledir
  echo '* * * * * * End cloning Vundle'
fi
echo '* * * End setting up Vundle'
echo ''

echo '======================================================'
echo '=== CONGRATS! Now boot vim and exec :PluginInstall ==='
echo '======================================================'
