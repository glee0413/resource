set nocompatible    "关闭vi的一致性模式 避免以前版本的一些Bug和局限
syn on              " 打开语法高亮
set expandtab       " 转义tab，当写python代码时很有用
set tabstop=4       " 设置tab键的宽度
set softtabstop=4
set backspace=2     " 设置退格键可用
"set backspace=indent,eol,start "配置backspace键工作方式
set smartindent     " 智能对齐方式
set shiftwidth=4    " 换行时行间交错使用4个空格
set autoindent      " 自动对齐
set cindent         "设置C/C++缩进方式
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
"set ai!             " 设置自动缩进
"设置在编辑过程中右下角显示光标的行列信息
"set ruler
"在状态栏显示正在输入的命令
"set showcmd
set history=1000
set nobackup
set noswapfile
"突出现实当前行列
set cursorline
set cursorcolumn

set nu!             " 显示行号
set linebreak       " 整词换行
set whichwrap=b,s,<,>,[,]       " 光标从行首和行末时可以跳到另一行去
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
set hidden          " 没有保存的缓冲区可以自动被隐藏

set scrolloff=5

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

"--------------------------------------------------------------------------------

" 查找/替换相关的设置

"--------------------------------------------------------------------------------

set hlsearch        " 高亮显示搜索结果

set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到

                    " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的

                    " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你

                    " 找要匹配的单词时，别忘记回车

set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个


set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号

colorscheme desert  "设置颜色模式

"--------------------------------------------------------------------------------

" 代码折叠

"--------------------------------------------------------------------------------

set foldmethod=syntax

set foldlevel=100       " Don't autofold anything (but I can still fold manually)

"set foldopen-=search   " don't open folds when you search into them

"set foldopen-=undo     " don't open folds when you undo stuff

"set foldcolumn=4

" 窗口操作的快捷键

"--------------------------------------------------------------------------------
"  垂直分割当前窗口
"nmap wv     <C-w>v    
 " 关闭当前窗口
"nmap wc     <C-w>c     
" 水平分割当前窗口
"nmap ws     <C-w>s

" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"vundle plugin

"开始使用Vundle的必须配置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'majutsushi/tagbar'
"map <Leader>tb :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
map <F3> :Tagbar<CR>
""autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启

Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F9> :NERDTreeToggle<CR>

Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

Bundle 'bling/vim-airline'
set laststatus=2

Bundle 'Townk/vim-autoclose'
Bundle 'Rename'
Bundle 'surround.vim'


call vundle#end()            " required
filetype plugin indent on    " required

