export XDG_CONFIG_HOME=$HOME/.config

source ~/.config/custom/aliases.sh

# Set nvim as default editor unless if it's a remote connection
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vi'
else
	export EDITOR='nvim'
fi
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
