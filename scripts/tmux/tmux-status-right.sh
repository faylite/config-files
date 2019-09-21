#!/usr/bin/env bash

# Author: Faylite
# Custom tmux line, right side
# Made to be modular and easy to change

source ~/.config-files/env/tmux.env

# Separators REQUIRES POWERLINE PATCHED FONTS!
len=20
sep=""
sep2=""

if [ "$TMUX_ENABLE_DEADBEEF" = "TRUE" ]
then
	# Get currently playing track info from deadbeef
	current_title=$(deadbeef --nowplaying-tf "%title%" | cut -c 1-15)
	current_artist=$(deadbeef --nowplaying-tf "%artist%" | cut -c 1-15)
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
	ret+="#[fg=colour237]$sep#[fg=white]#[bg=colour237]"
	ret+="#[fg=colour202]$sep#[fg=white]#[bg=colour202]"
	ret+=" ♪ $current_title - $current_artist "
fi

if [ "$TMUX_ENABLE_ITUNES" = "TRUE" ]
then
	state=$(osascript -e 'tell application "iTunes" to if it is running then player state')

	if [ "$state" = "playing" ]
	then
		track_name=$(osascript -e 'tell application "iTunes" to name of current track as string' | perl -pe "s/(?<=.{$len}).{1,}$/…/")
		track_artist=$(osascript -e 'tell application "iTunes" to artist of current track as string' | perl -pe "s/(?<=.{$len}).{1,}$/…/")

		ret+="#[fg=colour237]$sep#[fg=white]#[bg=colour237]"
		ret+="#[fg=colour202]$sep#[fg=white]#[bg=colour202]"
		ret+=" ♪ $track_name - $track_artist "
	fi
fi

# --- Current Date
ret+="#[fg=colour238]$sep#[fg=white]#[bg=colour238]"
ret+="#[fg=blue]$sep#[bg=blue]#[fg=white]"
ret+=" $current_day "
ret+="#[fg=colour235]$sep#[bg=colour235]#[fg=white]"
ret+=" $current_date"

# --- Current Time
ret+="#[fg=colour235]$sep#[bg=colour235]#[fg=blue]$sep#[bg=blue]#[fg=white]"
ret+=" $current_time "

# --- Battery Status for linux based machines
if [ "$TMUX_ENABLE_LINUX_BATTERY" = "TRUE" ]
then
	bat_full=$(cat /sys/class/power_supply/BAT0/charge_full)
	bat_now=$(cat /sys/class/power_supply/BAT0/charge_now)
	bat_status=$(cat /sys/class/power_supply/BAT0/status)

	bat_percent=$((100 * bat_now / bat_full))

	if [ $bat_status = "Discharging" ]
	then
		if [[ $bat_percent -lt 20 ]]
		then
			ret+="#[fg=colour160]$sep#[fg=white]"
			ret+="#[bg=colour160]"
		elif [[ $bat_percent -lt 60 ]]
		then
			ret+="#[fg=colour202]$sep#[fg=white]"
			ret+="#[bg=colour202]"
		else
			ret+="#[fg=colour149]$sep#[fg=black]"
			ret+="#[bg=colour149]"
		fi
		ret+=" $bat_percent%% "
	else
		ret+="#[fg=colour149]$sep#[fg=black]"
		ret+="#[bg=colour149]"
		ret+=" +$bat_percent%% "
	fi
fi

if [ "$TMUX_ENABLE_MAC_BATTERY" = "TRUE" ]
then
	ps_info=$(pmset -g ps)
	ps_type=$(echo $ps_info | sed -E -n 's/.*(AC|Battery) Power.*/\1/p')
	bat_percent=$(echo $ps_info | sed -E -n 's/.*[^[:digit:]]([0-9]+)%;.*/\1/p')

	if [ $ps_type = "Battery" ]
	then
		if [[ $bat_percent -lt 20 ]]
		then
			ret+="#[fg=colour160]$sep#[fg=white]"
			ret+="#[bg=colour160]"
		elif [[ $bat_percent -lt 60 ]]
		then
			ret+="#[fg=colour202]$sep#[fg=white]"
			ret+="#[bg=colour202]"
		else
			ret+="#[fg=colour149]$sep#[fg=black]"
			ret+="#[bg=colour149]"
		fi
		ret+=" $bat_percent%% "
	else
		ret+="#[fg=colour149]$sep#[fg=black]"
		ret+="#[bg=colour149]"
		ret+=" +$bat_percent%% "
	fi
fi

# Output new status line
printf "$ret"
