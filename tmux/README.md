# tmux

这个包安装 tmux 主配置、脚本、状态栏脚本和 tmux 专用 Starship 配置。它是本仓库里最核心的终端工作流配置。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S tmux
```

安装后主要路径：

- `~/.tmux.conf`
- `~/.config/tmux/`
- `~/.config/starship-tmux.toml`

建议和这些包一起安装：

```sh
stow -S zsh tmux kitty bin agent-tracker
```

## 基础行为

- prefix 改为 `Ctrl+s`。
- 默认 shell 为 `/bin/zsh`。
- 开启 mouse、focus events、true color、extended keys。
- window 和 pane index 从 `1` 开始。
- copy mode 使用 vi 风格。
- 状态栏每秒刷新一次，由 `tmux-status/left.sh` 和 `tmux-status/right.sh` 生成。
- pane border 会显示由 `pane_starship_title.sh` 生成的当前目录/命令标题。

## 常用快捷键

无需 prefix 的常用键：

- `Alt+S`：在当前路径新建 session。
- `Alt+O`：把当前 pane break 成独立 window。
- `Alt+o`：在当前路径新建 window。
- `Alt+Q`：关闭当前 pane。
- `Alt+1` 到 `Alt+9`：切换 window。
- `Ctrl+1` 到 `Ctrl+9`、`F1` 到 `F5`：按编号切换 session。
- `Alt+n/e/u/i`：切换到左/下/上/右 pane。
- `Alt+N/E/U/I`：向左/下/上/右调整 pane 大小。
- `Alt+f`：zoom 当前 pane。
- `Alt+v`：进入 copy mode。
- `Ctrl+Shift+v` 或 `Alt+Shift+V`：从系统剪贴板粘贴。
- `Alt+l/y`：切换上一个/下一个 window。
- `Alt+L/Y`：左右移动当前 window 顺序。
- `Alt+b`：手动切换当前 window unread 标记。
- `Alt+w`：watch 当前 pane。
- `Alt+s`：打开 agent palette。
- `Alt+m`：聚焦最近通知 pane。
- `Alt+M`：回到最近通知来源 pane。

prefix 后的常用键：

- `c`：新建 session。
- `.`：重命名 session。
- `,`：重命名 window。
- `u/e/n/i`：在当前路径向上/下/左/右分割 pane。
- `1` 到 `0`：把当前 window 移到第 1 到第 10 个 session。
- `l/y`：左右移动 session 顺序。
- `I/N/U/E`：用 layout builder 在右/左/上/下创建布局。
- `Space`：切换布局方向。
- `C-g`：切换 synchronize-panes。
- `Alt+s`：保存 tmux-resurrect 环境快照。
- `Ctrl+r`：恢复 tmux-resurrect 环境快照。
- `W`：打开 choose-tree。
- `S`、`V`：从 choose-tree 选择 pane 并移动到当前布局。
- `P`：切换 agent tracker 通知状态。

copy mode 内：

- `v`：开始选择。
- `Ctrl+v`：矩形选择。
- `n/e/u/i`：左/下/上/右移动。
- `y`：复制到系统剪贴板。
- `Y`：复制到行尾。
- `Ctrl+u`、`Ctrl+e`：上下滚动。

## 脚本目录

- `scripts/session_manager.py`：维护 session 编号、重命名、移动和 window 迁移。
- `scripts/open_shell_here.sh`：在当前路径打开 shell、window 或 split。
- `scripts/layout_builder.sh`：创建固定方向布局。
- `scripts/watch_pane.sh`：监听 pane 输出并更新状态栏标记。
- `scripts/restore_agent_run_panes.py`、`restore_agent_tracker_mapping.py`：恢复 agent 相关 pane 映射。
- `tmux-status/`：状态栏左右侧、窗口任务图标、内存、notes、agent tracker 状态等脚本。

## 插件

使用 TPM：

- `tmux-plugins/tpm`
- `tmux-plugins/tmux-resurrect`
- `tmux-plugins/tmux-continuum`

首次安装后在 tmux 内执行 TPM 安装快捷键，或按 TPM 文档手动安装插件。当前配置把 TPM 默认安装/更新/清理快捷键都改成了 `M-F12`，避免误触。

## 依赖和注意事项

- 需要 tmux，建议使用支持 true color 和 extended keys 的较新版本。
- 依赖 zsh、Python 3、bash、pbcopy/pbpaste。
- 和 kitty 配合时，Option/Alt 键位依赖 kitty 的 `macos_option_as_alt both`。
- agent-tracker 相关功能需要安装并构建 `agent-tracker` 包。
- 状态栏部分脚本会读取系统信息，macOS 环境下最完整。
