command -v fzf >/dev/null 2>&1 || return

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:---height 80% --reverse --bind=ctrl-t:top,change:top --bind=ctrl-e:down,ctrl-u:up}"
export FZF_TMUX="${FZF_TMUX:-1}"
export FZF_TMUX_HEIGHT="${FZF_TMUX_HEIGHT:-80%}"

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND:-fd --hidden --follow --exclude .git}"
elif command -v rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND:-rg --files --hidden --glob '!.git'}"
fi

function _fzf_dir_source() {
  if command -v fd >/dev/null 2>&1; then
    fd --type d --hidden --follow --exclude .git
  else
    find . -path '*/.git' -prune -o -type d -print
  fi
}

function fzf-redraw-prompt() {
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}
zle -N fzf-redraw-prompt

function fzf-cd-widget() {
  local dir
  dir="$(_fzf_dir_source | fzf +m)"
  [[ -n "$dir" ]] || return
  cd "$dir" || return
  LBUFFER=
  zle fzf-redraw-prompt
}
zle -N fzf-cd-widget
bindkey '^T' fzf-cd-widget

function fzf-history-widget() {
  local selected num
  selected="$(fc -rl 1 | fzf +s --query "$LBUFFER")"
  [[ -n "$selected" ]] || return
  num="${selected%% *}"
  zle vi-fetch-history -n "$num"
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

function fzf-find-widget() {
  local file
  file="$(eval "$FZF_DEFAULT_COMMAND" | fzf +m)"
  [[ -n "$file" ]] || return
  LBUFFER+="${(q)file}"
  zle reset-prompt
}
zle -N fzf-find-widget
bindkey '^P' fzf-find-widget

function fif() {
  if [[ $# -eq 0 ]]; then
    echo "Need a string to search for!"
    return 1
  fi

  rg --files-with-matches --no-messages "$1" |
    fzf --preview "rg --ignore-case --pretty --context 10 ${(q)1} {}"
}
