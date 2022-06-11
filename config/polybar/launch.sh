#!/usr/bin/bash
killall -q polybar
polybar -c ~/Projects/.dotfiles/config/polybar/config.ini -r main
