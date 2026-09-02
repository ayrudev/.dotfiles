bindkey -v
export KEYTIMEOUT=15 # default is 40 (400ms) — cuts the Esc-to-normal-mode lag

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q' # steady block — normal mode
  else
    echo -ne '\e[3 q' # steady underline — insert mode
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[3 q' # every new prompt starts in insert mode
}
zle -N zle-line-init

zshexit() {
  echo -ne '\e[3 q' # don't leave a block cursor behind when the shell exits
}
