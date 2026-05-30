# bash

这个包安装 Bash 启动配置到 home 目录，适合在仍然需要 Bash 的场景里保留基础环境。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S bash
```

安装后主要路径：

- `~/.bashrc`
- `~/.bash_profile`

## 配置内容

`~/.bashrc`：

- 加载 Fig 的 pre/post shell hook。
- 设置 `VOLTA_HOME="$HOME/.volta"`，并把 Volta 加进 `PATH`。
- 把 `~/.local/bin` 加进 `PATH`，用于本仓库 `bin` 包里的自定义命令。

`~/.bash_profile`：

- 加载 Fig 的 pre/post shell hook。
- 把 VS Code CLI 路径加进 `PATH`。
- 把 `~/.local/bin` 加进 `PATH`。
- 保留了一些 Maven、JetBrains、Volta 的历史配置注释，按需恢复。

## 使用

修改配置后重新打开 Bash，或手动加载：

```sh
source ~/.bashrc
source ~/.bash_profile
```

## 依赖和注意事项

- 这些配置偏 macOS 环境，尤其是 `/Applications/Visual Studio Code.app/...`。
- Fig 相关 hook 只有在对应文件存在时才会加载，不安装 Fig 也不会报错。
- 如果主要使用 zsh，Bash 配置通常只作为兼容层。
