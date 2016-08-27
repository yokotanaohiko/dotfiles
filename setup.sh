#!/bin/bash

DOT_FILES=(.vimrc .vim)

rm -r ~/.vim
rm ~/.vimrc

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

echo "complete"
