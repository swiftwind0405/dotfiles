<!-- BEGIN COMPOUND CODEX TOOL MAP -->
## Compound Codex Tool Mapping (Claude Compatibility)

This section maps Claude Code plugin tool references to Codex behavior.
Only this block is managed automatically.

Tool mapping:
- Read: use shell reads (cat/sed) or rg
- Write: create files via shell redirection or apply_patch
- Edit/MultiEdit: use apply_patch
- Bash: use shell_command
- Grep: use rg (fallback: grep)
- Glob: use rg --files or find
- LS: use ls via shell_command
- WebFetch/WebSearch: use curl or Context7 for library docs
- AskUserQuestion/Question: present choices as a numbered list in chat and wait for a reply number. For multi-select (multiSelect: true), accept comma-separated numbers. Never skip or auto-configure - always wait for the user's response before proceeding.
- Task/Subagent/Parallel: run sequentially in main thread; use multi_tool_use.parallel for tool calls
- TodoWrite/TodoRead: use file-based todos in todos/ with todo-create skill
- Skill: open the referenced SKILL.md and follow it
- ExitPlanMode: ignore
<!-- END COMPOUND CODEX TOOL MAP -->

# Working rules

Use a brief plan for multi-step or risky tasks. Use subagents only when they are available and materially improve the result.


## Git and branch rules
- Work directly on the current branch by default unless the task explicitly specifies another branch.
- Do not create Git commits unless explicitly asked.
- If creating a Git commit, write the commit message in Chinese and include the problem or request, the fix or implementation approach, and the reproduction path when useful.

## Communication rules
- Reply in Chinese, keep responses concise, use emoji sparingly where helpful, and keep proper nouns in English.

## Python environment
- The default/global Python on this machine is managed by `uv`.
- Project-specific environments, lockfiles, and toolchain files take precedence.
- When running Python outside a project environment and a dependency is missing, prefer `uv run --with <package> ...` (for example, `uv run --with pillow --with numpy python script.py`) instead of assuming `pip`, `conda`, or a mutable global site-packages setup.

## Tooling
- Use the best-fit tool for the task.
- If a missing tool or dependency would materially improve correctness, speed, or maintainability, try to install or enable it when permitted.
- Prefer project-local, temporary, or documented installation methods. Avoid mutating global environments unless the user asks for it or the machine convention clearly expects it.
- Fall back only after reasonable installation attempts fail or when the user requests a minimal/no-install approach.
