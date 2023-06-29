# Oh-my-ZSH 配置
#-------------------------------------------------------------------
# Path to your oh-my-zsh configuration.设置 ZSH默认路径
ZSH=$HOME/.oh-my-zsh

# 让zsh就可以继承.bash_profile的配置
# source ~/.bash_profile

# github-copilot-cli
# export PATH="$PATH:/Users/Stanley/.nvm/versions/node/v14.18.2/bin/github-copilot-cli"
# eval "$(github-copilot-cli alias -- "$0")"

# Load Antigen
source ~/antigen.zsh
# Load Antigen configurations
antigen init ~/.antigenrc


# -------------------------------------------------------------------
# antigen plugins 相关设置
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# plugins 设置
# -------------------------------------------------------------------

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

# plugins=(
# 	git 
# 	globalias
# 	node 
# 	svn 
# 	autojump 
# 	osx 
# 	npm 
# 	zsh-autosuggestions 
# 	sudo 
# 	web-search
# 	history 
# 	extract 
# 	last-working-dir
# 	copydir
# 	copyfile
# 	cp
# 	zsh_reload
# 	command-not-found # requirement : https://github.com/Homebrew/homebrew-command-not-found
# 	safe-paste
# 	colored-man-pages
# 	z
# 	zsh-better-npm-completion
# 	zsh-yarn-completions
# )

# Setup terminal, and turn on colors 颜色配置
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# 设置默认编辑器
alias vi='vim'
alias edit=$EDITOR
export EDITOR= "vim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/

# ZSH_THEME="ys"  原始设置
ZSH_THEME="spaceship"
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

fucntion mkd(){
	mkdir -p "$@" && cd "$@"
}

###列出系统最大的文件 快捷 maxfile 即可
maxfile(){
	lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail
}

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
		*.tar.gz)    tar xzf $1     ;;
	*.bz2)       bunzip2 $1     ;;
*.rar)       unrar e $1     ;;
	*.gz)        gunzip $1      ;;
*.tar)       tar xf $1      ;;
*.tbz2)      tar xjf $1     ;;
	*.tgz)       tar xzf $1     ;;
*.zip)       unzip $1       ;;
*.Z)         uncompress $1  ;;
	*.7z)        7z x $1        ;;
*)     echo "'$1' cannot be extracted via extract()" ;;
esac
	else
		echo "'$1' is not a valid file"
	fi
}

# -------------------------------------------------------------------
# VPS 相关 Servers in air
# -------------------------------------------------------------------

#alias vps-aliyun="ssh root@47.101.192.119"
# openwrt
alias openwrt="ssh -p 9002 root@home.stanleywind.cn"

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
alias gc= "git checkout"
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
python -m SimpleHTTPServer $1
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

alias proxy="export https_proxy=http://127.0.0.1:8234;export http_proxy=http://127.0.0.1:8234;export all_proxy=socks5://127.0.0.1:8235;echo \"Proxy successfully\""
alias unsetproxy="unset http_proxy;unset https_proxy;unset all_proxy;echo \"Unset proxy successfully\" " 

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

# SVN 设置
export PATH=/usr/bin:$PATH
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export PATH="/usr/local/bin:$PATH"

# source /Users/Stanley/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 由于Mac自带了php和php-fpm，因此需要添加系统环境变量PATH来替代自带PHP版本
#export PATH="$(brew --prefix php70)/bin:$PATH"      #for php
#export PATH="$(brew --prefix php70)/sbin:$PATH"		#for php-fpm

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/usr/local/bin:/usr/local/sbib:$PATH"	#for other brew install soft
export PATH="/usr/local/sbin:$PATH"

# JDK 环境变量
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
PATH=$JAVA_HOME/bin:$PATH:.
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export JAVA_HOME
export PATH
export CLASSPATH

# Android SDK 环境变量
# export ANDROID_HOME=/Users/Stanley/Library/Android/sdk
# export PATH="/usr/local/bin:$ANDROID_HOME/platform-tools:$PATH"n的环境变量
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# nvm环境变量
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export PATH="/usr/local/opt/tomcat@9/bin:$PATH"

# Jetbrains crack
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
