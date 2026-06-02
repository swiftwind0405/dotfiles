# pi

这个包管理 Pi Coding Agent 的全局 instruction。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S pi
```

安装后主要路径：

- `~/.pi/agent/AGENTS.md`

Pi 启动时会读取这个全局 `AGENTS.md`，并继续合并项目目录里的 `AGENTS.md` / `CLAUDE.md`。
