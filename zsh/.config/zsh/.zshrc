for rc_file in "$ZDOTDIR"/rc.d/*.zsh; do
  source "$rc_file"
done
unset rc_file
