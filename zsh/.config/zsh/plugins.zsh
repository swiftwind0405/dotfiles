# Zim modules are installed explicitly; shell startup only loads the built init.
export ZIM_CONFIG_FILE="${ZIM_CONFIG_FILE:-$ZSH_CONFIG_DIR/zimrc}"
export ZIM_HOME="${ZIM_HOME:-$HOME/.zim}"

if [[ -r "$ZIM_HOME/init.zsh" ]]; then
  source "$ZIM_HOME/init.zsh"
elif [[ -o interactive && -z "${ZIM_MISSING_NOTICE_SHOWN:-}" ]]; then
  export ZIM_MISSING_NOTICE_SHOWN=1
  print -u2 "zimfw not initialized. Run: brew install --formula zimfw && ZIM_CONFIG_FILE=$ZIM_CONFIG_FILE ZIM_HOME=$ZIM_HOME zsh -c 'source \$(brew --prefix)/opt/zimfw/share/zimfw.zsh install'"
fi
