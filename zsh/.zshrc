# Oh-my-ZSH configuration
ZSH_CONFIG_DIR="${ZSH_CONFIG_DIR:-$HOME/.config/zsh}"

[[ -r "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"

[[ -o interactive ]] || return

for zsh_config_file in \
  plugins.zsh \
  aliases.zsh \
  functions.zsh \
  tools.zsh \
  completion.zsh \
  fzf.zsh \
  vi.zsh
do
  [[ -r "$ZSH_CONFIG_DIR/$zsh_config_file" ]] && source "$ZSH_CONFIG_DIR/$zsh_config_file"
done

unset zsh_config_file
