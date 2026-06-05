alias grep='grep --color=auto'
alias vi='vim'
alias edit=$EDITOR
alias sz='source ~/.zshrc'

# AI tools
alias cc='claude --dangerously-skip-permissions --model "claude-sonnet-4-6"'
alias cc-opus='claude --dangerously-skip-permissions --model "claude-opus-4-7[1m]"'
alias agy='agy --dangerously-skip-permissions'
alias cx='codex --dangerously-bypass-approvals-and-sandbox -m gpt-5.5 -c model_reasoning_effort="high"'

# Directory movement
alias up="cd .."
alias bk="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias godesk='cd ~/Desktop'
alias mkjpg='mkdir JPG && mv *.JPG JPG/'

# Directory information
alias ls="ls -G"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias dus="du -smh * | sort -nr"
alias lh='ls -d .*'
alias ld="ls -lih"
alias map='traceroute'
alias tgz='tar -czf'
alias ugz='tar -xzf'
alias pwdc='pwd && pwd | pbcopy'
alias cleanDS='find . -name ".DS_Store" -print0 | xargs -0 rm -rf'

# Quick edit
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"

# Git
alias gam="git commit -a -m"
alias gamno="git commit --no-verify -a -m"
alias gc="git checkout"
alias gs="git status"
alias gp='git push'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
alias gb='git branch'
alias gd='git diff'

# Network and system
alias proxy="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153;export HTTPS_PROXY=\$https_proxy;export HTTP_PROXY=\$http_proxy;export ALL_PROXY=\$all_proxy;echo \"Proxy successfully\""
alias unproxy="unset http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY;echo \"Unset proxy successfully\" "
alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"
alias dns="dscacheutil -flushcache"
alias oo="open ."
alias update="brew update && brew upgrade && brew cu -a -y && mas upgrade"

# Development
alias cnpm="npm --registry=https://registry.npmmirror.com \
  --cache=$HOME/.npm/.cache/cnpm \
  --userconfig=$HOME/.cnpmrc"
