#!/usr/bin/env bash

# Author: Faylite
# Custom tmux line, left side
# Made to be modular and easy to change

# Separators REQUIRES POWERLINE PATCHED FONTS!
sepL=""
sepR=""

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

# Original
# set -g status-left '#[bg=blue]#[fg=white] #(echo $USER)@#H #[bg=colour236]#[fg=blue] #[fg=white]#S #[bg=colour236]#[bg=colour235]#[fg=colour236]'

# Output new status line
printf "$ret"
