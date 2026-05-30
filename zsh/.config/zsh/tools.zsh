# Optional tool integrations.
if command -v brew >/dev/null 2>&1; then
  autojump_profile="$(brew --prefix 2>/dev/null)/etc/profile.d/autojump.sh"
  [[ -s "$autojump_profile" ]] && source "$autojump_profile"
  unset autojump_profile
fi

if [[ -f "$HOME/Develop/python/google-cloud-sdk/path.zsh.inc" ]]; then
  source "$HOME/Develop/python/google-cloud-sdk/path.zsh.inc"
fi

if [[ -f "$HOME/Develop/python/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "$HOME/Develop/python/google-cloud-sdk/completion.zsh.inc"
fi

function _load_nvm() {
  unfunction nvm 2>/dev/null || true
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
}

function nvm() {
  _load_nvm
  nvm "$@"
}

[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

command -v jenv >/dev/null 2>&1 && eval "$(jenv init -)"
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
