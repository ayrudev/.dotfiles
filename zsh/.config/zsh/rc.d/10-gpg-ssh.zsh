export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

_gpg_update_tty() {
  export GPG_TTY=$(tty)
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1 &|
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _gpg_update_tty
