# Codex 全局提示词

通过 GNU Stow 只管理 `~/.codex/AGENTS.md`。

```sh
stow -S codex
```

`config.toml`、`auth.json`、sessions、logs、cache、sqlite 数据库、attachments 等其它 Codex 文件都保持本机私有，不纳入 git。
