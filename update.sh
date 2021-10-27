#!/usr/bin/bash

cd ~/Projects/.dotfiles/

echo "";
echo "Dotfiles updater";
echo "";

git pull origin main

while true; do
	read -p "Updating dotfiles | [C]ANCEL | [F]ETCH | [P]USH : " cfp
	case $cfp in
		[Cc]* ) exit;;
		[Ff]* ) ./scripts/update_fetch.sh && exit;;
		[Pp]* ) ./scripts/update_push.sh && exit;;
	esac
done
