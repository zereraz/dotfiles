#!/bin/zsh
cp ~/.vimrc ./.vimrc
cp ~/.tmux.conf ./.tmux.conf
cp ~/.zshrc ./.zshrc
git add .
git commit && git push origin master
