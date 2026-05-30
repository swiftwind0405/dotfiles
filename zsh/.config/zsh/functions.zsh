function cleannpm() {
  find ~/Workspace -type d -name node_modules -prune -exec rm -rf -- {} +
}

function cleanm2() {
  rm -rf -- ~/.m2
}

function mkd() {
  mkdir -p -- "$@" && cd -- "$1"
}

function maxfile() {
  lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail
}

function extract() {
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

function ze() {
  vim ~/.zshrc
}

function hosts() {
  sudo vim /etc/hosts
}

function vimrc() {
  vim ~/.vimrc
}

function hittp() {
  myip
  echo '你的服务器地址是:' $lanip
  python3 -m http.server $1
}

function nodeweb() {
  echo '启动Node Http Server'
  http-server
}

function hiweb() {
  sudo apachectl start
}

function myip() {
  myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
  lanip="$(echo $myip | awk '{print $2}')"
  publicip="$(echo $myip | awk '{print $6}')"
  echo '你的局域网IP是: '$lanip
  echo '你的外网IP是: '$publicip
}
