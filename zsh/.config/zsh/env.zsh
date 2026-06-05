# Shared zsh environment and PATH.
typeset -U path PATH

export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/Library/pnpm"
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 17 2>/dev/null || /usr/libexec/java_home 2>/dev/null || echo "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home")}"

__brew_prefix=""
if command -v brew >/dev/null 2>&1; then
  __brew_prefix="$(brew --prefix 2>/dev/null)"
elif [[ -x /usr/local/bin/brew ]]; then
  __brew_prefix="/usr/local"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  __brew_prefix="/opt/homebrew"
fi

__tool_paths=()
if [[ -n "$__brew_prefix" ]]; then
  __tool_paths+=("$__brew_prefix/bin" "$__brew_prefix/sbin")
  [[ -d "$__brew_prefix/opt/python@3.11/libexec/bin" ]] && __tool_paths+=("$__brew_prefix/opt/python@3.11/libexec/bin")
  [[ -d "$__brew_prefix/opt/openjdk@17/bin" ]] && __tool_paths+=("$__brew_prefix/opt/openjdk@17/bin")
fi

path=(
  "${__tool_paths[@]}"
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
unset __brew_prefix __tool_paths

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR="vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export http_proxy=http://127.0.0.1:6152
export https_proxy=http://127.0.0.1:6152
export all_proxy=socks5://127.0.0.1:6153
export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$https_proxy"
export ALL_PROXY="$all_proxy"
unset CODE_ASSIST_ENDPOINT

if command -v python3.11 >/dev/null 2>&1; then
  alias python="python3.11"
  alias python3="python3.11"
fi
