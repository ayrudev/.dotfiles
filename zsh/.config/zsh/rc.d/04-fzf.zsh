if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
