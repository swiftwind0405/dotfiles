# Shared zsh environment and PATH.
typeset -U path PATH

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""

export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/Library/pnpm"
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 17 2>/dev/null || /usr/libexec/java_home 2>/dev/null || echo "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home")}"

path=(
  /opt/homebrew/bin /opt/homebrew/sbin
  /opt/homebrew/opt/python@3.11/libexec/bin
  /opt/homebrew/opt/openjdk@17/bin
  "$HOME/.jenv/bin"
  "$HOME/.local/bin"
  "$BUN_INSTALL/bin"
  "$PNPM_HOME"
  "$JAVA_HOME/bin"
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  "/Applications/Obsidian.app/Contents/MacOS"
  "$HOME/.antigravity/antigravity/bin"
  $path
  /usr/local/bin /usr/local/sbin
  /usr/bin /bin /usr/sbin /sbin
)
export PATH

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR="vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
unset CODE_ASSIST_ENDPOINT

alias python="python3.11"
alias python3="python3.11"
