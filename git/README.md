# git

这个包安装全局 Git 配置和全局 ignore 规则。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S git
```

安装后主要路径：

- `~/.gitconfig`
- `~/.gitignore_global`

## 配置内容

`~/.gitconfig`：

- 设置用户信息：`Stanley <swiftwind0405@gmail.com>`。
- `push.default = current`，推送当前分支。
- `push.autoSetupRemote = true`，首次 push 自动设置 upstream。
- `pull.rebase = true`，默认用 rebase 拉取。
- `core.autocrlf = input`，提交时处理换行。
- `core.ignorecase = false`，文件名大小写敏感。
- `core.excludesfile = ~/.gitignore_global`。
- `http.sslverify = false`。
- 配置 Git LFS filter。
- `init.defaultBranch = master`。

`~/.gitignore_global`：

- 忽略 `*~`、`.DS_Store`、`.idea`、`tmp/`、`**/*.local.json`。

## 使用

安装后用下面命令确认生效：

```sh
git config --global --list
git config --global core.excludesfile
```

## 依赖和注意事项

- 如果换到新机器，建议先确认 `user.email` 是否仍然适用。
- `http.sslverify = false` 会关闭 Git HTTP SSL 校验，安全要求高的环境建议重新评估。
- Git LFS 配置需要本机安装 `git-lfs` 才能完整工作。
