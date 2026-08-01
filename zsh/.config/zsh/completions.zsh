# 1. Optimize compinit: Cache the dump file to significantly speed up shell startup
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C # -C skips the security check to load faster if cache is less than 24h old
fi

# 2. Make completion case-insensitive (optimized pattern)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 3. Use LS_COLORS for colored completion lists
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 4. Disable menu selection for completions (crucial for fzf-tab to work smoothly)
zstyle ':completion:*' menu no

# 5. fzf-tab previews: Combined into one pattern, safely quoted, using eza
zstyle ':fzf-tab:complete:(cd|__zoxide_z):*' fzf-preview 'eza -1 --color=always "$realpath"'