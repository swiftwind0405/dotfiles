使用 dotfiles 和 stow 管理 dotfiles

* TLDR;
#+BEGIN_SRC sh
brew install stow
cd ~
git clone git@github.com:jcouyang/dotfiles.git
cd dotfiles
stow .
#+END_SRC

*

* 使用 stow 管理 symlink
GNU stow 是管理符号链接（symlink）的一个小公举。只需要
#+BEGIN_SRC shell-script
brew install stow
#+END_SRC
 或者如果你非 mac 机器，请访问[[http://www.gnu.org/software/stow/][官网]]看看如何安装
