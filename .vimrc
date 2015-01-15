"==================================="
"	Name:   vim 配置文件			"
"	Time:   On January 15, 2015	"
"	Author: Minesta				"
"==================================="

"==================================="
"			   常规配置			    "					
"==================================="

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

set laststatus=2					" 总是显示状态行
set number							" 显示行号
syntax on							" 语法高亮
syntax enable						" 语法高亮
set autoindent						" 自动缩进
set cindent						" 设置C/C++语言自动缩进
set showmatch						" 高亮匹配括号
set scrolloff=3					" 光标移动到顶部和底部保持3行距离
set tabstop=4						" Tab键等于4
set softtabstop=4					" 每一级自动缩进的空格数
set shiftwidth=4					" 根据文件类型设定缩进，覆盖掉默认的
set smarttab						" 行和段开始处使用制表符
set cursorline						" 下划线当前行

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

colorscheme evening				" 配色方案

filetype on						" 侦测文件类型
filetype indent on				" 为特定文件载入相关缩进文件
filetype plugin on				" 载入文件类型插件
set nobackup						" 从不备份
set nocompatible					" 使用VIM键盘
set confirm						" 未保存或只读文件，弹出确认
set noexpandtab					" 不允许用空格代替制表符
set viminfo+=!						" 保存全局变量

set ignorecase						" 搜索时忽略大小写
" 搜索逐字符高亮
set hlsearch
set incsearch

" 可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 自动补全括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
set completeopt=longest,menu

"==================================="
"			   高级配置				"
"==================================="

" 映射全选+复制
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

map <F9> :! python % <CR>					" 运行python
nnoremap <F2> :g/^\s*$/d<CR>					" 去空行
map <C-n> :tabnew<CR>							" 新建标签
map <F3> :tabnew .<CR>						" 列出当前目录文件

" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

"==================================="
"				插 件				"
"==================================="
