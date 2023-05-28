# 使用 dotfiles 和 stow 管理 dotfiles

```shell
brew install stow
cd ~
git clone git@github.com:swiftwind0405/dotfiles.git
cd dotfiles
stow .
```

## 使用 stow 管理 symlink
stow 是管理符号链接（symlink）的一个小公举。只需要
```shell
brew install stow
```
 或者如果非 mac 机器，请访问[官网](http://www.gnu.org/software/stow/)看看如何安装
 
 
 ## ㊙ Sensitive dotfiles
 暂时没弄，后续可参考：[jcouyang/dotfiles: Jichao Ouyang's awesome dotfiles](https://github.com/jcouyang/dotfiles/tree/master)
