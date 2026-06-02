#!/usr/bin/env bash
set -euo pipefail

RESTORE_AGENT_RUN_PANES_SCRIPT="${TMUX_RESTORE_AGENT_RUN_PANES_SCRIPT:-${XDG_CONFIG_HOME:-$HOME/.config}/tmux/scripts/restore_agent_run_panes.py}"
RESTORE_AGENT_TRACKER_SCRIPT="${TMUX_RESTORE_AGENT_TRACKER_SCRIPT:-${XDG_CONFIG_HOME:-$HOME/.config}/tmux/scripts/restore_agent_tracker_mapping.py}"

restore_agent_tracker_mappings() {
  [[ -x "$RESTORE_AGENT_TRACKER_SCRIPT" ]] || return 0
  "$RESTORE_AGENT_TRACKER_SCRIPT" >/dev/null 2>&1 || true
}

restore_agent_run_panes() {
  [[ -x "$RESTORE_AGENT_RUN_PANES_SCRIPT" ]] || return 0
  "$RESTORE_AGENT_RUN_PANES_SCRIPT" >/dev/null 2>&1 || true
}

sleep 1
restore_agent_run_panes
restore_agent_tracker_mappings
