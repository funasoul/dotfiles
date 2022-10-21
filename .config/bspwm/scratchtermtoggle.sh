#!/usr/bin/env zsh

id=$(xdotool search --classname scratchpad_kitty)

if [ "$id" != "" ]; then
  bspc node "$id" --flag hidden -f
fi
