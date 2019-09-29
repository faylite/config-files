# Faylite's personal theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[238]------------------------------------------------------------%{$reset_color%}
$FG[031]%~\
 $(git_prompt_info) \

$FG[160]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}%(!.#.») %{$reset_color%}'
RPS1='${return_code}'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$FG[052]%n@%m%{$reset_color%}%'
else
	RPROMPT='$FG[052]%n@%m%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[245](branch:$FG[214]"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[245])%{$reset_color%}$FG[046]✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[245])%{$reset_color%}$FG[196]⁕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
