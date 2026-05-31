# Oh-my-zsh bundles managed by Antigen.
if [[ -n "${HOMEBREW_PREFIX:-}" && -r "$HOMEBREW_PREFIX/share/antigen/antigen.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/antigen/antigen.zsh"
  [[ -r "$HOME/.antigenrc" ]] && antigen init "$HOME/.antigenrc"
elif [[ -r /usr/local/share/antigen/antigen.zsh ]]; then
  source /usr/local/share/antigen/antigen.zsh
  [[ -r "$HOME/.antigenrc" ]] && antigen init "$HOME/.antigenrc"
fi
