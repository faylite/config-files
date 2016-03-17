#!/usr/bin/env bash

# Author: Faylite
# Custom tmux line, left side
# Made to be modular and easy to change

source ~/.local_env.sh

# Separators REQUIRES POWERLINE PATCHED FONTS!
sepL=""
sepL2=""
sepR=""
sepR2=""

if [ "$TMUX_ENABLE_DEADBEEF" = "TRUE" ]
then
	# Get currently playing track info from deadbeef
	current_title=$(deadbeef --nowplaying-tf "%title%")
	current_artist=$(deadbeef --nowplaying-tf "%title%")
fi
# Get current date in logial format ;)
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M)
current_day=$(date +%a)

# Build the status line
ret=""

if [ "$TMUX_ENABLE_DEADBEEF" = "TRUE" ]
then
	# --- Currently Playing deadbeef track ---
	ret+="#[fg=colour237]$sepR#[fg=white]#[bg=colour237]"
	ret+="#[fg=colour202]$sepR#[fg=white]#[bg=colour202]"
	ret+=" ♪ $current_title "
fi

# --- Current Date
ret+="#[fg=colour238]$sepR#[fg=white]#[bg=colour238]"
ret+="#[fg=blue]$sepR#[bg=blue]#[fg=white]"
ret+=" $current_day "
ret+="#[fg=colour235]$sepR#[bg=colour235]#[fg=white]"
ret+=" $current_date"

# --- Current Time
ret+="#[fg=colour235]$sepR#[bg=colour235]#[fg=blue]$sepR#[bg=blue]#[fg=white]"
ret+=" ⌚ $current_time "

# Output new status line
printf "$ret"
