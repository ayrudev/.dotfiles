ZSH_CACHE="$HOME/.cache/zsh"
[[ -d "$ZSH_CACHE" ]] || mkdir -p "$ZSH_CACHE"

# Oh My Posh
if [[ ! -f "$ZSH_CACHE/omp.zsh" ]]; then
  oh-my-posh init zsh --config "$HOME/.config/ohmyposh/omp.yaml" > "$ZSH_CACHE/omp.zsh"
fi
source "$ZSH_CACHE/omp.zsh"

# FZF
if [[ ! -f "$ZSH_CACHE/fzf.zsh" ]]; then
  fzf --zsh > "$ZSH_CACHE/fzf.zsh"
fi
source "$ZSH_CACHE/fzf.zsh"

# Zoxide
if [[ ! -f "$ZSH_CACHE/zoxide.zsh" ]]; then
  zoxide init --cmd cd zsh > "$ZSH_CACHE/zoxide.zsh"
fi
source "$ZSH_CACHE/zoxide.zsh"

# Load modules
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/enviroment.zsh
source ~/.config/zsh/gnupg.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/keybinds.zsh

# --- Antidote Plugin Management ---
source /usr/share/zsh-antidote/antidote.zsh

# Paths for Antidote logic
_antidote_plugins_txt="$HOME/.config/zsh/plugins.zsh"
_antidote_plugins_static="$HOME/.config/zsh/plugins.static.zsh"
_antidote_cache_dir="$HOME/.cache/antidote"

# Re-bundle if:
# 1. The static file is missing
# 2. The source .txt file is newer than the static file
# 3. The actual plugin cache directory is missing/empty
if [[ ! -f "$_antidote_plugins_static" || \
      "$_antidote_plugins_txt" -nt "$_antidote_plugins_static" || \
      ! -d "$_antidote_cache_dir" ]]; then
  
  # Ensure the directory exists so antidote has a place to download plugins
  mkdir -p "$_antidote_cache_dir"
  
  # Re-generate the static file and download missing plugins
  antidote bundle < "$_antidote_plugins_txt" > "$_antidote_plugins_static"
fi

source "$_antidote_plugins_static"

abbr load
