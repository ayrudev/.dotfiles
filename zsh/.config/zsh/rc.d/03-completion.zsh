autoload -Uz compinit

zcompdump="$XDG_CACHE_HOME/zsh/.zcompdump"
mkdir -p "$(dirname "$zcompdump")"

# Only check dump freshness once per day — skips a stat() call per shell
if [[ -n "$zcompdump"(#qN.mh+24) ]]; then
  compinit -d "$zcompdump"
else
  compinit -C -d "$zcompdump"
fi
unset zcompdump

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case-insensitive matching
