# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Oh-my-ZSH 配置
#-------------------------------------------------------------------
# Path to your oh-my-zsh configuration.设置 ZSH默认路径
ZSH=$HOME/.oh-my-zsh

# 让zsh就可以继承.bash_profile的配置
source ~/.bash_profile

########## 基础 PATH 兜底，防止 bash_profile 把 PATH 玩坏 ##########
# Apple Silicon + 常规 Unix 路径
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# 使用 Homebrew 的 Python 3.11 提供的 python / python3 / pip 等（软链接在 libexec/bin 里）
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
alias python="python3.11"
alias python3="python3.11"
########## 基础 PATH 兜底结束 ##########
# ---- PATH 统一收敛（zsh 原生数组 + 去重）----
typeset -U path PATH   # 去重，保留第一次出现的顺序

# 约定优先级：Homebrew(arm) > 用户本地 > 其余已有 > /usr/local(旧) > 系统
path=(
  /opt/homebrew/bin /opt/homebrew/sbin
  $HOME/.local/bin
  $path
  /usr/local/bin /usr/local/sbin
  /usr/bin /bin /usr/sbin /sbin
)
export PATH
# ---- PATH 统一收敛结束 ----

path=("$HOME/.local/bin" $path)
path=("/opt/homebrew/opt/openjdk@17/bin" $path)
path=("$BUN_INSTALL/bin" $path)
path=("$HOME/.jenv/bin" $path)
export PATH

# Load Antigen
# 这个path是brew安装的路径
#source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh
# 这个path是 apple 芯片的 Mac brew 安装的路径
source /opt/homebrew/share/antigen/antigen.zsh
# Load Antigen configurations
antigen init ~/.antigenrc

# Setup terminal, and turn on colors 颜色配置
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# homebrew install禁用自动更新
export HOMEBREW_NO_AUTO_UPDATE=1

alias grep='grep --color=auto'

# 设置默认编辑器
alias vi='vim'
export EDITOR="vim"
alias edit=$EDITOR

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/

alias sz='source ~/.zshrc' #重新执行

# -------------------------------------------------------------------
# Directory movement 文件夹移动
# -------------------------------------------------------------------
alias up="cd .."
alias bk="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias godesk='cd ~/Desktop'
alias mkjpg='mkdir JPG && mv *.JPG JPG/'

# -------------------------------------------------------------------
# Directory information 文件信息
# -------------------------------------------------------------------
alias ls="ls -G"
# alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias dus="du -smh * | sort -nr" #根据文件大小排序
alias lh='ls -d .*' # show hidden files/directories only #只显示隐藏文件
alias ld="ls -lih"
alias map='traceroute' #路由跟踪
alias tgz='tar -czf' #tar -czf [文件名] [被压缩文件] gzip压缩
alias ugz='tar -xzf' #tar -xzf [被压缩文件]
#alias pwd='pwd && pwd' #查看当前路径
alias pwdc='pwd && pwd | pbcopy' #查看当前路径并且复制
alias cleanDS='find . -name ".DS_Store" -print0 | xargs -0 rm -rf' #清除目录下的 DS_Store文件

# 删除所有的 node_modules 目录
function cleannpm() {
  find ~/Workspace -type d -name node_modules -prune -exec rm -rf -- {} +
}

# 清理 Maven 目录
function cleanm2() { rm -rf -- ~/.m2; }

function mkd() { mkdir -p -- "$@" && cd -- "$1"; }

###列出系统最大的文件 快捷 maxfile 即可
maxfile(){
	lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail
}

extract () {
  local f="$1"
  [[ -f "$f" ]] || { echo "'$f' is not a valid file"; return 1; }
  case "$f" in
    *.tar.bz2) tar xjf -- "$f" ;;
    *.tar.gz)  tar xzf -- "$f" ;;
    *.bz2)     bunzip2 -- "$f" ;;
    *.rar)     unrar e -- "$f" ;;
    *.gz)      gunzip -- "$f" ;;
    *.tar)     tar xf -- "$f" ;;
    *.tbz2)    tar xjf -- "$f" ;;
    *.tgz)     tar xzf -- "$f" ;;
    *.zip)     unzip -- "$f" ;;
    *.Z)       uncompress -- "$f" ;;
    *.7z)      7z x -- "$f" ;;
    *) echo "'$f' cannot be extracted via extract()"; return 2 ;;
  esac
}


# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"


# -------------------------------------------------------------------
# 快速编辑常用文件 Quick Edit
# -------------------------------------------------------------------

###快速编辑
ze(){
	vim ~/.zshrc  #编辑ZSH配置文件
}
hosts(){
	sudo vim /etc/hosts  #编辑 hosts 文件
}
vimrc(){
	vim ~/.vimrc #编辑vim配置
}

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias gam="git commit -a -m"
alias gamno="git commit --no-verify -a -m"
alias gc="git checkout"
alias gs="git status"
alias gp='git push'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
alias gb='git branch'  #显示所有本地分支
alias gd='git diff' #显示缓存变化

# -------------------------------------------------------------------
# 极点客  Geek
# -------------------------------------------------------------------
# 利用 python 内置快速建立个简单的服务器
function hittp {
myip
echo '你的服务器地址是:' $lanip
# Python 版本是 3.X
python3 -m http.server $1
# Python 版本是 2.X
# python3 -m SimpleHTTPServer $1
}
function nodeweb {
echo '启动Node Http Server'
 http-server
}

# 终端设置代理
#export https_proxy=http://127.0.0.1:8888
#export http_proxy=http://127.0.0.1:8888
#export all_proxy=socks5://127.0.0.1:8889
#export NO_PROXY=localhost,127.0.0.1
###上面的三行命令表示,每次新建一个终端会话时,默认让终端去走代理,这样就不需要每次都复制拷贝一下了,很方便,同时,代理程序去智能分流(国内 IP 直连,国外走代理)，避免了连接国内 IP 地址时“绕远”.

alias proxy="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153;echo \"Proxy successfully\""
alias unproxy="unset http_proxy;unset https_proxy;unset all_proxy;echo \"Unset proxy successfully\" " 

alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"
## 上面这几个 alias 是自定义的命令
## unsetproxy 取消代理
## setproxy 设置代理
## ip & ipcn  查看 IP

# 快速开启apache
function hiweb {
sudo apachectl start
}

alias mbp="ssh stanley@192.168.31.250"

# 快速查看本机IP地址
function myip(){
myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
lanip="$(echo $myip | awk '{print $2}')"
publicip="$(echo $myip | awk '{print $6}')"
echo '你的局域网IP是: '$lanip
echo '你的外网IP是: '$publicip
}

# -------------------------------------------------------------------
# 系统相关 Mac Only
# -------------------------------------------------------------------
alias dns="dscacheutil -flushcache"
alias oo="open ." # open current directory in OS X Finder
alias update="brew update && brew upgrade && brew cu -a -y && mas upgrade"  # update all app

# 开启Pure ?
# fpath+=("/usr/local/share/zsh/site-functions")
# autoload -U promptinit; promptinit
# prompt pure

# -------------------------------------------------------------------
# 开发相关
# -------------------------------------------------------------------

# Npm相关
alias cnpm="npm --registry=http://r.cnpmjs.org \
	--cache=$HOME/.npm/.cache/cnpm \
	--disturl=http://dist.cnpmjs.org \
	--userconfig=$HOME/.cnpmrc"
# Chinese Support 中文支持
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# autojump（brew 已经在 PATH 里了）
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# JDK 环境变量
export JAVA_HOME=$(/usr/libexec/java_home -v 17 2>/dev/null || /usr/libexec/java_home 2>/dev/null || echo "/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home")
path=("$JAVA_HOME/bin" $path)
export CLASSPATH="$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:."
export PATH
 
export TERM=xterm-256color 

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
path=("$PNPM_HOME" $path)
export PATH

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/Develop/python/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/Develop/python/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/Develop/python/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/Develop/python/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -------------------------------------------------------------------
# AI相关
# -------------------------------------------------------------------

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
eval "$(jenv init -)"

# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("$HOME/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END
