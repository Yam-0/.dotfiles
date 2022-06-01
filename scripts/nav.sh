#!/usr/bin/bash

navlock="$HOME/navlock.json"
navlock_backup="$HOME/navlock_backup.json"

if ! command -v cat &> /dev/null
then
    echo "\"cat\" command could not be found."
	echo "nav will need it."
	return
fi

if ! command -v jq &> /dev/null
then
	echo "\"jq\" command could not be found."
	echo "nav will need it."
	return
fi

# Generate flag
if [[ "$1" = "-g" || "$1" = "-G" || "$1" = "--generate" ]]
then
	echo "{ \"charts\": { } }" > $navlock
	return
fi

# Restore flag
if [[ "$1" = "-r" || "$1" = "-r" || "$1" = "--restore" ]]
then
	if test -f "$navlock_backup"
	then
		cp $navlock_backup $navlock
		return
	else
		echo No backup file found.
		return
	fi
fi

# navlock location
if test -f "$navlock"
then
	:
else
	echo Navlock file not found.
	echo Generate a blank one with -g
	echo Or restore a backup with -r
	echo nav -h for more information.
	return
fi

# No flags
if [ $# -eq 0 ]
then
	echo "Navigator, a commandline utility tool for quick navigation."
	echo "nav -h for more information."
	return
fi

# Add flag
if [[ "$1" = "-a" || "$1" = "-A" || "$1" = "--add" ]]
then
	if [ $# -lt 2 ]
	then
		echo "Add: Missing arguments."
		return
	fi

	echo $(cat "$navlock" | jq '.charts += { "'$2'": "'$PWD'" }') > "$navlock"
	echo "Added \"$PWD\" as \"$2\"."
	return
fi

# Delete flag
if [[ "$1" = "-d" || "$1" = "-D" || "$1" = "--delete" ]]
then
	if [ $# -lt 2 ]
	then
		echo "Delete: Missing arguments."
		return
	fi

	echo $(cat "$navlock" | jq 'del(.charts.'$2')') > "$navlock"
	echo "Removed \"$2\" chart."
	return
fi

# Print flag
if [[ "$1" = "-p" || "$1" = "-P" || "$1" = "--print" ]]
then
	echo "Charts in navlock: "
	cat $navlock | jq .charts
	return
fi

# Help flag
if [[ "$1" = "-h" || "$1" = "-H" || "$1" = "--help" ]]
then
	echo "Usage:"
	echo "  nav [chart]                Move to directory"
	echo "  nav [chart] [commands ...] Move and execute commands"
	echo "  nav [option] [chart]       Edit navlock"
	echo ""
	echo "Options:"
	echo "  -a, -A, --add              Add chart"
	echo "  -d, -D, --delete           Delete chart"
	echo "  -p, -P, --print            Print navlock"
	echo "  -g, -G, --generate         Generate blank navlock file"
	echo "  -b, -B, --backup           Backup navlock file"
	echo "  -r, -R, --restore          Restore navlock backup"
	echo "  -v, -V, --version          Display version info"
	echo "  -h, -H, --help             Display this"
	echo ""
	echo "Chart:"
	echo "  Saved directories, stored as (key, value) pairs in navlock"
	echo ""
	echo "Navlock:"
	echo "  File containing all defined charts."
	echo ""
	echo "Examples:"
	echo "  nav --add projects         Adds working directory as key"
	echo "  nav projects               Go to projects directory"
	echo "  nav -p                     Print charts"
	return
fi

# Version flag
if [[ "$1" = "-v" || "$1" = "-V" || "$1" = "--version" ]]
then
	echo "Version: 1.0.4"
	echo "By Tage Åkerström."
	return
fi

# Backup flag
if [[ "$1" = "-b" || "$1" = "-B" || "$1" = "--backup" ]]
then
	cp $navlock $navlock_backup
	return
fi

# Reroot if found
if location=$(cat $navlock | jq .charts.$1 2> /dev/null)
then
	if [ $location != "null" ]
	then
		if cd "$(echo $location | tr  -d '"')"
		then
			if [ $# -gt 1 ]
			then
				$2
				$3
				$4
				$5
				$6
				$7
				$8
				$9
			else
				ls -a
			fi
		else
			echo Failed to set directory.
		fi
	else
		echo \"$1\" not in navlock.
		return
	fi
else
	echo Failed to parse input.
fi
