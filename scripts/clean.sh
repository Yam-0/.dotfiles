#!/usr/bin/bash

# Clear cache
sudo pacman -Scc

# Remove orphans
sudo pacman -Rns $(pacman -Qtdq)

# Remove everything in .cache
rm -rf ~/.cache/*

# Info
df -h .
echo Done!
