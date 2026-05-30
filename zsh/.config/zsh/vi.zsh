autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^V' edit-command-line
bindkey -v
KEYTIMEOUT=1

function zle-keymap-select() {
  if [[ "$KEYMAP" == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

function _fix_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
