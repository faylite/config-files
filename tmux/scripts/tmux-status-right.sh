#!/usr/bin/env bash

# Author: Faylite
# Custom tmux line, left side
# Made to be modular and easy to change

# Separators REQUIRES POWERLINE PATCHED FONTS!
sepL=""
sepR=""
# Get currently playing track info from deadbeef
current_title=$(deadbeef --nowplaying-tf "%title%")
current_artist=$(deadbeef --nowplaying-tf "%title%")
# Get current date in logial format ;)
current_date=$(date +%d-%m-%Y)
current_time=$(date +%H:%M)

# Build the status line
ret=""

# --- Currently Playing deadbeef track ---
ret+="#[fg=colour236]$sepR#[fg=white]#[bg=colour236]"
ret+=" ♫$current_title "

# --- Current Date
ret+="#[fg=colour237]$sepR#[fg=white]#[bg=colour237]"
ret+=" $current_date "

# --- Current Time
ret+="#[fg=blue]$sepR#[bg=blue]#[fg=white]"
ret+=" ⌚ $current_time "

# Output new status line
printf "$ret"
