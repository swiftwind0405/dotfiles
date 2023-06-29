# 使用 dotfiles 和 stow 管理 dotfiles

> 其实就是把 dotfiles 放到一个文件夹里，然后用 stow 管理 symlink

```shell
brew install stow
cd ~
git clone git@github.com:swiftwind0405/dotfiles.git
cd dotfiles
```

在每台计算机上，我进入 dotfiles 目录，并运行 stow -S <目录名称> 以将目录中的文件符号链接到我的家目录。例如，在 vim 目录下，我有 .vimrc 和 .vim 目录。在每台机器上，我运行 stow -S vim 来创建符号链接 ~/.vimrc 和 ~/.vim。当我在一台计算机上更改 Vim 配置时，它会应用到我的所有机器上。

然而，有时候，我需要一些特定于机器的配置，这就是为什么我有如 msmtp-personal 和 msmtp-company（公司）这样的目录。由于我的 msmtp SMTP 客户端需要知道要中继电子邮件服务器，并且每个服务器都有不同的设置和凭据，我会使用 -D 标志来取消链接，接着链接另外一个。

## 使用 stow 管理 symlink
stow 是管理符号链接（symlink）的一个小工具。只需要
```shell
brew install stow
```
 或者如果非 mac 机器，请访问[官网](http://www.gnu.org/software/stow/)看看如何安装
 
 ## ㊙ Sensitive dotfiles
 暂时没弄，后续可参考：[jcouyang/dotfiles: Jichao Ouyang's awesome dotfiles](https://github.com/jcouyang/dotfiles/tree/master)

 ## Hammerspoon 配置

所以配置文件都在 `config.lua` 文件中，你可以按照自己的习惯或者需求修改此文件。

> 注：修改 `.lua` 文件会自动加载。

### 窗口管理

* <kbd>Control</kbd><kbd>Command</kbd> + <kbd>Return</kbd> `最大化窗口`
* <kbd>Control</kbd><kbd>Command</kbd> + <kbd>→</kbd> `把窗口移动到右边显示器`
* <kbd>Control</kbd><kbd>Command</kbd> + <kbd>←</kbd> `把窗口移动到左边显示器`
* <kbd>Control</kbd><kbd>Command</kbd> + <kbd>F</kbd> `全屏或者退出全屏`

### 快速启动

* <kbd>Option</kbd> + <kbd>G</kbd> `Google Chrome`
* <kbd>Option</kbd> + <kbd>F</kbd> `Microsoft Edge`
* <kbd>Option</kbd> + <kbd>U</kbd> `EuDic`
* <kbd>Option</kbd> + <kbd>C</kbd> `Visual Studio Code`
<!-- * <kbd>Option</kbd> + <kbd>I</kbd> `iTerm` -->
* <kbd>Option</kbd> + <kbd>D</kbd> `Dash`
* <kbd>Option</kbd> + <kbd>X</kbd> `IntelliJ IDEA`
* <kbd>Option</kbd> + <kbd>W</kbd> `Warp`


### 切换输入法

* <kbd>Option</kbd> + <kbd>S</kbd> `Squirrel输入法`
* <kbd>Option</kbd> + <kbd>E</kbd> `系统 ABC`
* <kbd>Option</kbd> + <kbd>.</kbd> `系统 ABC、Squirrel输入法轮流切换`

### 自动切换输入法

具体看 `config.lua` 文件里面的 `appInputMethod` 值

### 自动开关蓝牙

休眠自动关闭蓝牙，然后自动开启蓝牙。使用这个功能之前先要安装 `blueutil`

```sh
brew install blueutil
```

### 连接公司 Wi-Fi 自动静音

修改配置文件中的 `workWifi` 为公司 Wi-Fi 名称，如果你的 MacBook 默认语言不是中文，则需要修改 `outputDeviceName` 的值。