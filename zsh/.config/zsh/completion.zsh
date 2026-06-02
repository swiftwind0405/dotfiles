# Completion setup. Add all fpath entries before running compinit once.
fpath=("$HOME/.zfunc" $fpath)

autoload -Uz compinit

zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ ! -f "$zcompdump" || "$zcompdump" -ot "$HOME/.zshrc" ]]; then
  compinit
else
  compinit -C
fi

unset zcompdump
