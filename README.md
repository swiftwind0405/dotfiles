# 使用 dotfiles 和 stow 管理 dotfiles

> 其实就是把 dotfiles 放到一个文件夹里，然后用 stow 管理 symlink

```shell
brew install stow
cd ~
git clone git@github.com:swiftwind0405/dotfiles.git
cd dotfiles
stow .
```

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
* <kbd>Option</kbd> + <kbd>I</kbd> `iTerm`
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