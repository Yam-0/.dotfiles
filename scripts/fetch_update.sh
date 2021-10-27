#!/usr/bin/bash

cd ~/Projects/.dotfiles

git fetch origin main
git pull origin main

# nvim
rm -rf ~/.config/nvim/init.vim
rm -rf ~/_vimrc
cp ~/Projects/.dotfiles/init.vim ~/.config/nvim/init.vim
cp ~/Projects/.dotfiles/_vimrc ~/_vimrc

# i3
rm -rf ~/.config/i3/*
cp -a ~/Projects/.dotfiles/config/i3/. ~/.config/i3/

# Alacritty
rm -rf ~/.config/alacritty/*
cp -a ~/Projects/.dotfiles/config/alacritty/. ~/.config/alacritty/
