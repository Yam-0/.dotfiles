#!/usr/bin/bash

echo "Config file updater";
echo "";

while true; do
	read -p "Update action: [C]ancel | [P]ush local | [F]etch origin : " cpf
	case $cpf in
		[Cc]* ) echo "Canceled" && exit;;
		[Pp]* ) echo "Pushing" && ./scripts/push_update.sh;;
		[Ff]* ) echo "Fetching" && ./scripts/fetch_update.sh;;
	esac
done
