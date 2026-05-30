# lazygit

这个包安装 lazygit 配置到 `~/.config/jesseduffield/lazygit`。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S lazygit
```

安装后主要路径：

- `~/.config/jesseduffield/lazygit/config.yml`

## 配置内容

- 关闭退出确认：`confirmonquit: false`。
- Git 自动 fetch。
- 合并时不强制 manual commit。
- 使用 `delta` 作为 pager。
- 关闭 reporting。
- UI 使用 rounded border、Nerd Font 图标、暗色主题。
- 顶层按 Return 直接退出：`quitOnTopLevelReturn: true`。

## 快捷键

这份配置把 lazygit 的方向键改成和本仓库其他工具一致：

- `Alt+u`：上一项。
- `Alt+e`：下一项。
- `Alt+n`：上一个 block。
- `Alt+i`：下一个 block。
- `=`：下一个搜索结果。
- `-`：上一个搜索结果。
- `k`：新建。
- `o`：编辑或在浏览器打开，具体取决于面板。
- `O`：打开文件或启动 interactive rebase，具体取决于面板。
- `l`：undo。
- `Ctrl+r`：redo。
- `M`：diffing menu。
- `Ctrl+f`：filtering menu。
- `v`：range select。

## 依赖和注意事项

- 需要安装 `lazygit`。
- pager 依赖 `delta`，未安装时 diff 显示可能失败或退化。
- 图标显示依赖 Nerd Font。
