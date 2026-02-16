# ---------------- theme ---------------------------

# See: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

precmd() {
  if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
  local prompt_return_info="%(?..%{%F{196}%}%? ↵%{$reset_color%})"

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local git_status=$(git status --porcelain 2>/dev/null)
    local git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $git_status ]]; then
      prompt_git_info="%F{245}(%F{214}$git_branch%F{245})%F{196}⁕%F{245}"
    else
      prompt_git_info="%F{245}(%F{214}$git_branch%F{245})%F{046}✓%F{245}"
    fi
  else
    prompt_git_info=""
  fi

  export PS1="%F{238}------------------------------------------------------------
%F{031}%~ $prompt_git_info\

%F{160}%(!.#.»)%f "
  export RPS1="$prompt_return_info"
}


