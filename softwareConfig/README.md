# softwareConfig

这个包保存一些按软件原始目录结构归档的配置。目前主要是 Espanso 配置。

## 安装

在 dotfiles 根目录执行：

```sh
stow -S softwareConfig
```

安装后主要路径：

- `~/Documents/SoftwareConfig/Espanso/base.yml`

## Espanso 配置

`base.yml` 定义常用文本替换：

- 箭头符号：`;>>`、`;vv`、`;^^`、`;<<`。
- Markdown 代码块：`;js`、`;swift`。
- 常用联系方式：`;mobi`、`;gmail`、`;live`。
- 常用短句：`;chongt`。
- 代码片段：`;log`、`;delay`。
- macOS 按键符号：`:cmd`、`:shift`、`:ctrl`、`:alt`、`:opt` 等。
- 日期时间：`;date` 输出 `YYYY-MM-DD`，`;now` 输出 `HH:MM`。

## 使用

确认 Espanso 的配置目录指向或同步到：

```text
~/Documents/SoftwareConfig/Espanso
```

如果 Espanso 实际读取的是默认目录，需要在 Espanso 中配置引用，或手动把 `base.yml` 放到当前 Espanso 配置目录。

## 依赖和注意事项

- 需要安装 Espanso。
- 这个包不会安装到 `~/.config/espanso`，而是安装到 `~/Documents/SoftwareConfig/Espanso`。
- 文件里包含个人联系方式，公开同步前需要确认是否适合暴露。
