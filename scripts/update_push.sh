#!/usr/bin/bash

echo "Overwriting repository config";

# Overwrite i3
# rm -rf ~/.config/i3/*
# cp -a ~/Projects/.dotfiles/config/i3/. ~/.config/i3/
rm -rf ~/Projects/.dotfiles/config/i3/*
cp -a ~/.config/i3/. ~/Projects/.dotfiles/config/i3/

echo "Done.";
