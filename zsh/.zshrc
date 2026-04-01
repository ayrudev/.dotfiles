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

source /usr/share/zsh-antidote/antidote.zsh
# Only bundle if the static file is missing or the plugin list is newer
if [[ ! -f ~/.config/zsh/plugins.static.zsh || ~/.config/zsh/plugins.zsh -nt ~/.config/zsh/plugins.static.zsh ]]; then
  antidote bundle < ~/.config/zsh/plugins.zsh > ~/.config/zsh/plugins.static.zsh
fi
source ~/.config/zsh/plugins.static.zsh

abbr load
