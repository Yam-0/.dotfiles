#!/usr/bin/bash

flocation=$(fzf)

if [ $flocation != "null" ]
	then

	nvim "$(echo $flocation | tr  -d '"')" -c Reroot
fi
