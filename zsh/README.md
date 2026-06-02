# zsh

这个包安装 zsh 启动配置到 home 和 `~/.config/zsh`。它是当前主要 shell 配置。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S zsh
```

安装后主要路径：

- `~/.zshrc`
- `~/.zshenv`
- `~/.zprofile`
- `~/.config/zsh/`

## 加载顺序

`~/.zshrc` 会先设置配置目录：

```sh
ZSH_CONFIG_DIR="${ZSH_CONFIG_DIR:-$HOME/.config/zsh}"
```

然后加载：

1. `env.zsh`
2. 如果是非交互 shell，直接返回。
3. `plugins.zsh`
4. `aliases.zsh`
5. `functions.zsh`
6. `tools.zsh`
7. `completion.zsh`
8. `fzf.zsh`
9. `vi.zsh`

## 环境和工具

`env.zsh`：

- 设置 Homebrew、Python 3.11、OpenJDK 17、jenv、`~/.local/bin`、Bun、pnpm、VS Code、Obsidian、Antigravity 等路径。
- 设置 `JAVA_HOME`，优先使用 Java 17。
- 设置 `EDITOR=vim`、`LANG=en_US.UTF-8`、`LC_ALL=en_US.UTF-8`。
- 关闭 Homebrew 自动更新，配置 Homebrew bottle 镜像。
- 把 `python` 和 `python3` alias 到 `python3.11`。

`plugins.zsh`：

- 设置 `ZIM_CONFIG_FILE=~/.config/zsh/zimrc` 和 `ZIM_HOME=~/.zim`。
- 如果 `~/.zim/init.zsh` 存在，则加载 Zim 已构建的插件初始化脚本。
- 如果 Zim 尚未初始化，只在交互 shell 打印安装提示，不自动下载远程脚本。

`zimrc`：

- 使用 Zim 管理 `git`、`zsh-completions`、`zsh-autosuggestions`、`fast-syntax-highlighting`。
- 不加载其他 zsh framework 或 framework 插件。

`tools.zsh`：

- 加载 Homebrew autojump。
- 加载 Google Cloud SDK path 和 completion。
- 懒加载 nvm。
- 加载 Bun completion。
- 初始化 jenv 和 starship。

`fzf.zsh`：

- 配置 fzf 默认参数。
- 优先用 `fd` 作为默认文件源，失败时用 `rg --files`。
- `Ctrl+t` 用 fzf 选择目录并 cd。
- `Ctrl+r` 搜索历史命令。
- `Ctrl+p` 搜索文件并插入命令行。
- `fif <文本>` 搜索包含指定文本的文件，并用 fzf 预览匹配。

`vi.zsh`：

- 开启 vi mode。
- `Ctrl+v` 编辑当前命令行。
- 根据 insert/normal mode 切换光标形状。

## 常用 alias 和函数

基础：

- `sz`：重新加载 `~/.zshrc`。
- `edit`：打开 `$EDITOR`。
- `up`、`..`、`...`、`....`：快速返回上级目录。
- `pwdc`：打印当前目录并复制到剪贴板。
- `cleanDS`：删除当前目录下 `.DS_Store`。

Git：

- `gs`：`git status`
- `gp`：`git push`
- `gc`：`git checkout`
- `gd`：`git diff`
- `gb`：`git branch`
- `gl`：格式化 git log。

AI tools：

- `cc`：Claude Sonnet，跳过权限确认。
- `cc-opus`：Claude Opus，跳过权限确认。
- `agy`：Antigravity CLI。
- `cx`：Codex，bypass approvals and sandbox，使用高 reasoning。

网络和系统：

- `proxy` / `unproxy`：设置或取消本地代理。
- `ipcn`、`ip`：查看公网 IP。
- `dns`：刷新 DNS cache。
- `update`：Homebrew、brew cu、mas 更新。

函数：

- `mkd <dir>`：创建目录并进入。
- `extract <file>`：按扩展名解压常见压缩包。
- `cleannpm`：删除 `~/Workspace` 下的 `node_modules`。
- `cleanm2`：删除 `~/.m2`。
- `myip`：显示局域网和外网 IP。
- `hittp <port>`：启动 Python HTTP server。

## 依赖和注意事项

- 主要面向 macOS 和 Homebrew。
- 推荐安装 `zimfw`、`starship`、`fzf`、`fd`、`ripgrep`、`jenv`、`autojump`、`bun`、`pnpm`、`nvm`。
- `JAVA_HOME` 自动探测失败时会回退到旧 JDK 路径，换机器后建议检查。
- AI alias 都带有跳过确认参数，使用前确认当前目录和权限边界。

## Zim 初始化

首次安装或换机器后，先安装 `zimfw`：

```sh
brew install --formula zimfw
```

然后初始化模块并生成 `~/.zim/init.zsh`：

```sh
ZIMFW_SCRIPT="$(brew --prefix)/opt/zimfw/share/zimfw.zsh"
ZIM_CONFIG_FILE="$HOME/.config/zsh/zimrc" ZIM_HOME="$HOME/.zim" zsh -c "source '$ZIMFW_SCRIPT' install"
```

修改 `~/.config/zsh/zimrc` 后，重新运行初始化命令，或在已经加载 Zim 的 shell 里执行：

```sh
zimfw install
```

## 旧机器迁移步骤

如果另一台机器之前已经 stow 过旧版 zsh 配置，按这个顺序迁移：

1. 拉取最新版 dotfiles：

```sh
cd ~/dotfiles
git pull
```

2. 重新展开 zsh 包：

```sh
stow -R zsh
```

3. 安装并初始化 Zim：

```sh
brew install --formula zimfw
ZIMFW_SCRIPT="$(brew --prefix)/opt/zimfw/share/zimfw.zsh"
ZIM_CONFIG_FILE="$HOME/.config/zsh/zimrc" ZIM_HOME="$HOME/.zim" zsh -c "source '$ZIMFW_SCRIPT' install"
```

4. 清理旧插件管理器和缓存：

```sh
rm -f ~/.antigenrc
rm -rf ~/.antigen
brew uninstall antigen
```

如果 `brew uninstall antigen` 提示没有安装，可以忽略。

5. 验证新 shell：

```sh
zsh -lic 'echo ok; zimfw list; command -v antigen || true; echo ZIM_HOME=$ZIM_HOME'
```

预期输出里应包含：

```text
ok
modules/git
modules/zsh-completions
modules/zsh-autosuggestions
modules/fast-syntax-highlighting
ZIM_HOME=/Users/<user>/.zim
```
