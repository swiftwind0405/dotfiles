# Oh-my-zsh bundles managed by Antigen.
if [[ -r /opt/homebrew/share/antigen/antigen.zsh ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
  [[ -r "$HOME/.antigenrc" ]] && antigen init "$HOME/.antigenrc"
elif [[ -r /usr/local/share/antigen/antigen.zsh ]]; then
  source /usr/local/share/antigen/antigen.zsh
  [[ -r "$HOME/.antigenrc" ]] && antigen init "$HOME/.antigenrc"
fi
