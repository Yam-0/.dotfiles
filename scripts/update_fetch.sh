#!/usr/bin/bash

echo "Overwriting local config";

# Overwrite i3
rm -rf ~/.config/i3/*
cp -a ~/Projects/.dotfiles/config/i3/. ~/.config/i3/

echo "Done.";
