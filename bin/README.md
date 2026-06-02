# bin

这个包把自定义命令安装到 `~/.local/bin`。建议确保 shell 的 `PATH` 包含 `~/.local/bin`，本仓库的 `zsh` 和 `bash` 包都已经配置了这个路径。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S bin
```

安装后主要路径：

- `~/.local/bin/agent`
- `~/.local/bin/ai-mem-usage`
- `~/.local/bin/ask`
- `~/.local/bin/nvim-lazy-reset`
- `~/.local/bin/pinchtab-up`

## 命令说明

- `agent`：转发到 `~/.config/agent-tracker/bin/agent`。使用前需要先安装并构建 `agent-tracker`。
- `ai-mem-usage`：统计 `pi`、`dart` 相关进程的内存，并尝试映射到 tmux pane/window。
- `ask`：用隔离的临时 `CODEX_HOME` 调用 Codex CLI，读取 prompt 文件，可选附加图片。
- `nvim-lazy-reset`：对 `~/.local/share/nvim/lazy` 下所有 lazy.nvim 插件执行 `git reset --hard` 和 `git clean -fd`。
- `pinchtab-up`：检查并启动 PinchTab，优先使用 daemon，失败后回退到后台 server。

## 常用用法

```sh
agent --help
ai-mem-usage
ask --prompt-file prompt.txt
ask --prompt-file prompt.txt -i screenshot.png
nvim-lazy-reset
pinchtab-up
```

## 依赖和注意事项

- `ask` 依赖 `/opt/homebrew/bin/codex` 和 `~/.codex/auth.json`。
- `agent` 依赖 `agent-tracker` 包完成构建。
- `ai-mem-usage` 依赖 macOS 的 `top`、`ps`，并在 tmux 中效果最好。
- `nvim-lazy-reset` 会丢弃插件目录里的本地改动，执行前确认没有需要保留的插件修改。
- `pinchtab-up` 依赖 `pinchtab` 在 `PATH` 中，或通过 `PINCHTAB_BIN` 指定。
