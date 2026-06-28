# kitty

这个包安装 kitty 终端配置到 `~/.config/kitty`。当前配置把 kitty 作为 tmux 入口使用。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S kitty
```

安装后主要路径：

- `~/.config/kitty/kitty.conf`
- `~/.config/kitty/start-tmux.sh`

## 配置内容

- `allow_remote_control yes`：允许远程控制 kitty。
- `macos_option_as_alt both`：左右 Option 都作为 Alt/Meta。
- GUI 启动时显式设置 `PATH`，避免拿不到 Homebrew 命令。
- 默认 shell 通过 `~/.config/kitty/start-tmux.sh` 启动 `tmux`。
- 字体为 `LigaSauceCodePro Nerd Font`，字号 `14.0`。
- 使用 Dracula 风格颜色和自定义 tab bar。
- `ctrl+1` 到 `ctrl+9` 切换 kitty tab。

## 使用

打开 kitty 后会直接进入 tmux。如果要让这个行为生效，建议同时安装：

```sh
stow -S tmux kitty
```

如果只想启动普通 shell，可以临时注释：

```conf
shell /bin/sh -lc 'exec "$HOME/.config/kitty/start-tmux.sh"'
```

## 依赖和注意事项

- 需要安装 kitty。
- `start-tmux.sh` 会按当前架构优先选择 Homebrew 路径：Apple Silicon 优先 `/opt/homebrew`，Intel 优先 `/usr/local`，并保留 Linuxbrew 和当前 `PATH` 作为 fallback。
- 启动脚本只在新建 kitty 会话时执行一次，找到 `tmux` 后会 `exec tmux`，不会留下额外常驻 shell 进程。
- 需要安装 `LigaSauceCodePro Nerd Font`，否则图标和符号可能显示异常。
- 如果没有安装 `tmux`，kitty 会落回登录 shell，并在 stderr 输出提示。
