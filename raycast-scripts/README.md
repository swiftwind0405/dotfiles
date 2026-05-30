# raycast-scripts

这个包安装 Raycast Script Commands 到 `~/.config/raycast-scripts`，用于切换 Claude Code 相关的声音提示状态。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S raycast-scripts
```

安装后主要路径：

- `~/.config/raycast-scripts/claude-code-ring-toggle.sh`
- `~/.config/raycast-scripts/claude-code-voice-toggle.sh`
- `~/.config/raycast-scripts/stop-voice-tts.sh`

## 使用

在 Raycast 中添加 Script Commands 目录：

```text
~/.config/raycast-scripts
```

然后可以搜索并运行：

- `Toggle Claude Ring Mode`：切换 `~/.claude/ring-enabled`。开启时会关闭 voice mode。
- `Toggle Claude Voice`：切换 `~/.claude/voice-enabled`。
- `Stop Voice (TTS)`：停止所有 `say` 进程。

## 状态文件

- `~/.claude/ring-enabled` 存在表示 ring mode 开启。
- `~/.claude/voice-enabled` 存在表示 voice mode 开启。

## 依赖和注意事项

- 需要安装 Raycast。
- 脚本使用 macOS 的 `say` 进程名停止 TTS。
- ring mode 和 voice mode 会互斥：开启 ring mode 时会删除 voice flag。
