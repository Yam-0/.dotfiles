#!/usr/bin/bash

curl -s https://api.jokes.one/jod > ~/.bin/scripts/cow
cat ~/.bin/scripts/cow | jq -r .contents.jokes[0].joke.title | echo
cat ~/.bin/scripts/cow | jq -r .contents.jokes[0].joke.text | cowsay
