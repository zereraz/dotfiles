#!/bin/bash
rm ./.vimrc
rm ./.tmux.conf
cp ~/.vimrc ./.vimrc
cp ~/.tmux.conf ./.tmux.conf
git add .
git commit && git push origin master
