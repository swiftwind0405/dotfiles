"语法高亮
syntax on
"显示行号
set number
"显示光标所在位置的行号和列号
set ruler
set wrap                      "自动折行
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab                  "将tab替换为相应数量空格
set smartindent
set backspace=2
"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"set laststatus=2   "命令行为两行
"set fenc=utf-8     "文件编码
"set mouse=a        "启用鼠标
"set ignorecase     "忽略大小写
"set cursorline     "突出显示当前行
"set cursorcolumn   "突出显示当前列
 
set fdm=marker
 
"jj退出insert模式
"inoremap <C-j> <ESC>
inoremap jk <ESC>
 
"nmap ,v "+p
"vmap ,c "+y
"nmap ,c "+y
vmap ,c :w !pbcopy<CR><CR>
nmap ,c :w !pbcopy<CR><CR>
nmap ,v :r !pbpaste<CR><CR>
 
"设置vundle
set nocompatible              " be iMproved
filetype off                  " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
filetype plugin indent on     " required!
"vundle设置完毕
 
"Bundle 'taglist.vim'
"let Tlist_Ctags_Cmd='ctags'
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_WinWidt =28                   "设置taglist的宽度
"let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口
 
Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=20                   "窗口宽度的设置
map <F3> :Tagbar<CR>
map <C-t> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启
 
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
let g:NERDTreeNodeDelimiter = "\u00a0"
"let g:NERDTreeNodeDelimiter = ''
"map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
"打开NERDTree
"autocmd vimenter * NERDTree
"光标默认在主窗口
"wincmd w
"autocmd VimEnter * wincmd w
"vim 退出时直接关闭NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 
Bundle 'bling/vim-airline'
set laststatus=2
 
Bundle 'scrooloose/nerdcommenter'
 
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>
 
"vim-multiple-cursors 多光标选中
"Bundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_key='<C-m>'
"let g:multi_cursor_start_word_key='g<C-m>'
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<C-j>'
 
"MatchTagAlways
Bundle 'Valloric/MatchTagAlways'
 
"Markdown语法高亮
Bundle 'godlygeek/tabular'
"Bundle 'plasticboy/vim-markdown'
"markdown实时显示
Bundle 'suan/vim-instant-markdown'
 
"indentLine 代码缩进线标志线
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
"映射到ctrl+I键
"map <C-i> :IndentLinesToggle<CR>
 
"delimitMate 自动补全引号(单引号/双引号/反引号), 括号(()[]{})

