# hammerspoon

这个包安装 Hammerspoon 配置到 `~/.hammerspoon`，用于应用启动、输入法切换、Wi-Fi 自动静音等 macOS 自动化。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S hammerspoon
```

安装后主要路径：

- `~/.hammerspoon/init.lua`
- `~/.hammerspoon/config.lua`
- `~/.hammerspoon/modules/`

## 使用

安装 Hammerspoon 后，打开应用并执行 Reload Config。之后修改 `~/.hammerspoon/*.lua` 会自动触发 reload。

当前启用模块：

- `modules.reload`：监听 `~/.hammerspoon` 下 Lua 文件变化并自动 reload。
- `modules.launcher`：绑定快捷键启动或聚焦应用。
- `modules.input`：保留输入法切换函数，目前手动快捷键已注释，避免影响终端 Option/Meta。
- `modules.defaultInput`：根据当前 App 自动切换 ABC 或 Squirrel 输入法。
- `modules.wifi`：连接指定公司 Wi-Fi 时自动静音内置扬声器。

未启用但保留的模块：

- `modules.window`：窗口最大化、全屏、跨屏移动，当前已迁移到 Raycast。
- `modules.bluetoothSleep`：锁屏关闭蓝牙、解锁打开蓝牙。

## 快捷键

应用启动快捷键使用 `command + control + option + shift` 加字母：

- `G`：Google Chrome
- `C`：Codex
- `R`：Cursor
- `O`：Obsidian
- `K`：kitty
- `E`：Microsoft Edge

调试快捷键：

- `cmd + shift + h`：播放测试语音并发送通知。
- `ctrl + cmd + .`：显示当前 App path、App name 和输入法 source id。

## 依赖和注意事项

- 需要安装 Hammerspoon。
- 中文输入法 source id 使用 Squirrel：`im.rime.inputmethod.Squirrel.Hans`。
- 英文输入法使用系统 ABC：`com.apple.keylayout.ABC`。
- `workWifi` 当前为 `CAIDAO-dev-5G`，`outputDeviceName` 当前为 `MacBook Pro扬声器`，换机器后可能需要改。
- 如果启用蓝牙睡眠模块，需要安装 `blueutil`，并确认路径是否为 `/usr/local/bin/blueutil`。
