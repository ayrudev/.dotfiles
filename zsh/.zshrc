eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh-antidote/antidote.zsh
antidote load ~/.config/zsh/plugins.zsh ~/.config/zsh/plugins.zsh.static

# Load modules
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/enviroment.zsh
source ~/.config/zsh/gnupg.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/keybinds.zsh


