# 使用 dotfiles 和 stow 管理 dotfiles

```shell
brew install stow
cd ~
git clone git@github.com:swiftwind0405/dotfiles.git
cd dotfiles
```

 或者如果非 mac 机器，请访问[官网](http://www.gnu.org/software/stow/)看看如何安装

## 第一次收集配置文件

第一次收集配置文件时，推荐使用`--adopt`选项转移配置文件。具体操作如下：

1. 在家目录下创建`stow dir`， 比如命名为 dotfiles。

2. 在`stow dir`下分门别类的创建好各类配置文件的文件夹，比如专门放置 bash 相关配置文件的文件夹。

3. 在 bash 文件夹下创建对应的配置文件，文件内容为空即可，比如`.bashrc`，`.bash_profile`。

4. 在`stow dir`下执行`stow --adopt bash`，这一命令分别对比`target dir`（也即是家目录）和 bash 目录的结构，
   并将家目录下同树结构的文件采纳到`stow dir`下：将`.bashrc`移到bash目录覆盖掉对应的空配置文件，
   并在家目录创建符号链接指向转移过来的配置文件。

5. 重复上述 2-4 步，陆续添加其他文件夹和配置文件。

收集到配置文件后，我们一般使用 git 来管理，这样可以方便的跟踪修改，也可以方便的拉取到另一台电脑上。
实际上，我们上面使用的`--adopt` 命令可以结合 git 来方便的对比两台电脑间配置文件的不同。
`--adopt`选项会处理 stow 遇到的冲突文件，并统一采用`target dir`下的文件**替换**`stow dir` 下的文件，
当`stow dir`被 git 管理时，被替换的文件就可以方便的和仓库中的文件对比，方面你修改，采纳，或者删除。

**注意**: `--adopt`选项会修改`stow dir`下的内容，非第一次收集配置文件，或者`stow dir`没有被版本控制软件管理前，请谨慎使用。

## 将收集的配置文件应用到新的系统中

将项目拉取到新的机器的家目录，切换到`stow dir`，执行`stow -S bash`可以将bash的配置文件展开到家目录下。
你也可以使用多个组合命令：`stow -S pkg1 pkg2 -D pkg3 pkg4 -S pkg5 -R pkg6`

- `-d` 指定 stow 文件夹
- `-t` 指定 target 文件夹
- `-D` 移除已创建的文件树
- `-S` 创建指定的文件树
- `-R` 移除并重新创建指定的文件树

- `--ignore=regexp` 忽略`stow dir`下指定匹配模式的文件
- `--defer=regexp` 跳过`target dir`下指定匹配模式的文件
- `--override=regexp` 强制替换`target dir`下指定匹配模式的文件

- `--no-folding` stow 默认创建最少的符号链接。这一选项会使 stow 逐一创建每一个文件的符号链接，而不是创建一整个文件夹的链接。
- `--dotfiles` 在 stow dir 下的文件名如果有`dot-`前缀，在创建链接时，链接名字会替换为以`.`为前缀，
  比如：`～/.zshrc -> dotfiles/zsh/dot-zshrc`

GNU Stow 不会对冲突的文件做任何处理，并中断所有操作，我没有找到一个快捷的覆盖已存在文件的选项，
`-D` 和 `--override=regexp` 并不能对已存在的文件进行覆盖替换，除非它是符号链接或者文件夹并已经处于`stow dir`的管理之下。

如果因为文件已经存在而发生了冲突，一个直接的办法是先删掉已存在的文件。而另一个方法则是结合使用 `--adopt`选项和 git。
首先将已存在的配置文件全部采纳到 git 管理之下的 stow dir，然后选择性的采纳，修改，或舍弃，
使用 git 的 commit 和 checkout，你可以方便的取舍冲突的配置文件。
如果你知道stow更好的方法，请在 issue 中告诉我，谢谢～

更多信息请参见 [GNU Stow 手册页](https://www.gnu.org/software/stow/manual/stow.html)


 
 ## ㊙ Sensitive dotfiles
 暂时没弄，后续可参考：[jcouyang/dotfiles: Jichao Ouyang's awesome dotfiles](https://github.com/jcouyang/dotfiles/tree/master)

<details>
  <summary>Hammerspoon 配置</summary>

所有配置文件都在 `config.lua` 文件中，可以按照自己的习惯或者需求修改此文件。

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
</details>