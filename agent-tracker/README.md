# agent-tracker

这个包把 Agent Tracker 安装到 `~/.config/agent-tracker`。它是一个和 tmux 联动的 agent 任务、通知和状态追踪工具，仓库里保留的是源码、配置和安装脚本。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S agent-tracker
```

安装后主要路径：

- `~/.config/agent-tracker/agent-config.json`：按键、设备列表、状态栏开关配置。
- `~/.config/agent-tracker/install.sh`：用 Go 构建 `tracker-server`、`tracker-mcp` 和 `agent`。
- `~/.config/agent-tracker/scripts/`：tmux 通知聚焦、brew service 安装、测试脚本。
- `~/.config/agent-tracker/README.md`：工具源码目录里的构建说明。

## 使用

首次安装后先构建二进制：

```sh
~/.config/agent-tracker/install.sh
```

如果要安装并重启 brew service，使用源码目录内的脚本：

```sh
~/.config/agent-tracker/scripts/install_brew_service.sh
```

`bin` 包里的 `~/.local/bin/agent` 是一个薄封装，会转发到 `~/.config/agent-tracker/bin/agent`。因此通常需要同时安装：

```sh
stow -S agent-tracker bin
```

## tmux 集成

`tmux` 配置会在这些场景调用 `agent`：

- client attached、pane focus、window select 时确认通知。
- pane 退出时删除对应任务。
- `M-s` 打开 agent palette。
- `M-m` 聚焦最近通知的 pane。
- `M-M` 回到通知来源 pane。
- prefix 后按 `P` 切换通知状态。

## 依赖和注意事项

- 需要 Go，用于构建源码。
- 需要 tmux 集成时，同时安装 `tmux` 包。
- `agent-config.json` 里的方向键采用 `n/e/u/i` 风格，和本仓库的 tmux、yazi、lazygit 键位保持一致。
