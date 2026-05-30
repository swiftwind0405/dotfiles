# yazi

这个包安装 Yazi 文件管理器配置到 `~/.config/yazi`，包括主配置、键位、主题、插件和 Yazi 内使用的 Starship 配置。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S yazi
```

安装后主要路径：

- `~/.config/yazi/yazi.toml`
- `~/.config/yazi/keymap.toml`
- `~/.config/yazi/init.lua`
- `~/.config/yazi/theme.toml`
- `~/.config/yazi/package.toml`
- `~/.config/yazi/starship.toml`
- `~/.config/yazi/plugins/`

## 配置内容

`yazi.toml`：

- 文件列表比例为 `[1, 3, 4]`。
- 默认按文件名字母排序，目录优先。
- 默认显示 size linemode。
- 隐藏文件默认不显示。
- 配置 macOS、Linux、Windows 的 open/reveal/edit 规则。
- 图片、视频、PDF、字体、压缩包等都有 previewer 或 preloader。
- Git fetcher 已启用。

`init.lua`：

- 启用 `yaziline` 状态栏。
- 启用 `starship`，使用 `~/.config/yazi/starship.toml`。
- 启用 `git` 插件显示 Git 状态。
- 在右侧状态区显示当前文件 owner/group。
- 启用 `yamb` 书签插件，使用 `fzf`。

`package.toml` 当前声明的插件：

- `llanosrocas/yaziline`
- `Rolv-Apneseth/starship`
- `yazi-rs/plugins:git`
- `yazi-rs/plugins:smart-enter`
- `h-hg/yamb`
- `KKV9/compress`

## 常用快捷键

移动和进入：

- `u/e`：上/下移动。
- `n` 或 Left：返回父目录。
- `i` 或 Enter：smart enter，目录则进入，文件则打开。
- `N/I`：后退/前进历史。
- `gg`、`G`：到顶部/底部。

选择和文件操作：

- Space：选择当前项并下移。
- `v`：进入选择模式。
- `yy`：复制选中文件。
- `dd`：剪切选中文件。
- `p p`：粘贴。
- `p P`：强制覆盖粘贴。
- `d D`：永久删除。
- `T`：创建文件。
- `M`：创建目录。
- `a`、`A`、`k`、`cw`：不同光标位置的重命名。

查找和跳转：

- `Ctrl+p`：用 fzf 跳转目录或 reveal 文件。
- `z o`：用 zoxide 跳转。
- `F`：用 ripgrep 搜内容。
- `f`：过滤当前列表。
- `/`、`?`：向后/向前查找。
- `g h`、`g d`、`g D`、`g c`：跳到 home、Downloads、Desktop、config。
- `g f y`：跳到 Yazi 配置目录。

插件相关：

- `' a`：保存书签。
- `' '`：用 fzf 跳转书签。
- `' r`：按 key 删除书签。
- `c a`：压缩选中文件。
- `Ctrl+g`：在当前目录打开 lazygit。

## 依赖和注意事项

- 需要安装 `yazi`。
- 插件管理依赖 `ya pkg`。
- 推荐安装 `fzf`、`zoxide`、`ripgrep`、`fd`、`starship`、`lazygit`。
- 图片和特殊格式预览可能依赖 `magick`、`mpv`、`mediainfo`、`exiftool` 等外部工具。
- 图标和状态栏符号依赖 Nerd Font。
