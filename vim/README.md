# vim

这个包安装 Vim 配置。当前同时保留了 `~/.vimrc` 和 `~/.vim/.vimrc` 两份配置。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S vim
```

安装后主要路径：

- `~/.vimrc`
- `~/.vim/.vimrc`

## `~/.vimrc`

这是较轻量的 Vim 配置：

- leader 为 `,`。
- 系统剪贴板使用 `unnamed` 和 `unnamedplus`。
- `Ctrl+S` 保存。
- 搜索默认 `ignorecase`。
- tab 切换和移动使用一组 leader 快捷键。
- insert mode 中模拟部分 Emacs 光标移动。
- 使用 4 空格缩进。
- 开启 undo file，目录为 `~/.vim/undo/`。
- 文件编码优先 UTF-8，并兼容 GB 系列编码。
- `,n` 切换行号，`,r` 切换相对行号，`,h` 清除搜索高亮。

## `~/.vim/.vimrc`

这是较完整的历史配置：

- 开启语法高亮、行号、ruler、自动缩进。
- 禁用 backup 和 swapfile。
- `jk` 退出 insert mode。
- `,c` 复制到 macOS 剪贴板，`,v` 从剪贴板粘贴。
- 使用 Vundle 管理插件。
- 配置了 Tagbar、NERDTree、vim-airline、nerdcommenter、MatchTagAlways、vim-instant-markdown、indentLine 等插件。

## 常用快捷键

- `Ctrl+s`：保存。
- `Shift+h/l`：切换上一个/下一个 tab。
- `,t`：新建 tab。
- `,e`：编辑文件。
- `,n`：切换行号。
- `,r`：切换相对行号。
- `,h`：取消搜索高亮。
- `Ctrl+n`：在完整配置里切换 NERDTree。
- `F3` 或 `Ctrl+t`：在完整配置里打开 Tagbar。

## 依赖和注意事项

- 完整配置依赖 Vundle，插件目录预期为 `~/.vim/bundle/vundle/`。
- Tagbar 依赖 `ctags`。
- macOS 剪贴板快捷键依赖 `pbcopy` 和 `pbpaste`。
- `~/.vimrc` 和 `~/.vim/.vimrc` 同时存在时，实际加载哪份取决于 Vim 的启动方式和配置链路；建议后续逐步收敛到一份。
