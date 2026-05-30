# snipaste

这个包安装 Snipaste 配置到 `~/.snipaste`。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S snipaste
```

安装后主要路径：

- `~/.snipaste/config.ini`

## 配置内容

- 语言为中文：`language=zh_cn`。
- 开机启动：`start_on_boot=true`。
- 关闭自动备份：`auto_backup=false`。
- 关闭增强托盘菜单：`enhanced_tray_menu=false`。
- ESC 不再询问确认：`ask_for_confirm_on_esc=false`。
- 禁用自动检查更新：`check_every=false`。

## 使用

安装后重启 Snipaste，或在 Snipaste 设置中重新加载配置。当前配置没有绑定自定义截图热键，热键仍以应用内设置为准。

## 依赖和注意事项

- 需要安装 Snipaste。
- 配置文件内的 `config=~/.snipaste/config.ini` 指向自身。
- 如果在 Snipaste UI 里修改设置，可能会直接改写这个文件。
