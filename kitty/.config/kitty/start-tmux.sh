#!/bin/sh

# Finder-launched kitty gets a minimal PATH. Prefer the Homebrew prefix that
# matches the current architecture, but keep the other common prefix as fallback.
case "$(uname -m 2>/dev/null)" in
  arm64 | aarch64)
    brew_paths="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin"
    ;;
  *)
    brew_paths="/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin"
    ;;
esac

linuxbrew_paths="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"
system_paths="/usr/bin:/bin:/usr/sbin:/sbin"

PATH="$brew_paths:$linuxbrew_paths:$system_paths${PATH:+:$PATH}"
export PATH

if command -v tmux >/dev/null 2>&1; then
  exec tmux
fi

printf '%s\n' "tmux was not found in PATH: $PATH" >&2
printf '%s\n' "Install tmux or edit ~/.config/kitty/start-tmux.sh." >&2
exec "${SHELL:-/bin/zsh}" -l
