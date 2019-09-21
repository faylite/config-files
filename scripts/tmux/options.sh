#!/usr/bin/env bash

# Author: Faylite
# Options for TMUX styling

# Separators REQUIRES POWERLINE PATCHED FONTS!
sepL=""
sepL2=""
sepR=""
sepR2=""

bgp="#[bg=blue]"
bgs="#[bg=colour236]"
bgs2="#[bg=colour235]"

fgp="#[fg=white]"

# Build the status line
ret=""

# Show current user
ret+="#[bg=blue]#[fg=white]"
ret+=" $USER"
# and current machine/server
ret+="@$HOSTNAME "

# Session name
ret+="#[bg=colour236]#[fg=blue]$sepL#[fg=white]"
ret+=" #S "

# End bit
ret+="#[bg=colour236]#[bg=colour235]#[fg=colour236]$sepL"

# Output new status line
printf "$ret"
