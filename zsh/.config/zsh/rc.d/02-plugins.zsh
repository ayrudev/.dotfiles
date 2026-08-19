local antidote_path="$ZDOTDIR/antidote/antidote.zsh"

if [[ ! -f "$antidote_path" ]]; then
  echo "antidote not found — cloning..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ZDOTDIR/antidote"
fi

source "$antidote_path"

export ABBR_USER_ABBREVIATIONS_FILE="$ZDOTDIR/abbreviations"
antidote load "$ZDOTDIR/plugins.txt"

zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:*:*' fzf-preview 'ls --color $realpath 2>/dev/null'
