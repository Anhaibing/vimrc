"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is based on the vimrc by Amix - http://amix.dk/
"
" Maintainer: Li Yang
" Version: 0.1
" Last Change:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
Plugin 'Pysics/winmanager'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Rip-Rip/clang_complete'

call vundle#end()            " required

"filetype plugin indent on    " required

" " To ignore plugin indent changes, instead use:
filetype plugin on
filetype indent on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"Quickfix
nnoremap <silent> <F6> :cn<CR>
nnoremap <silent> <F5> :cp<CR>

"Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F7>
"you also can :set paste, :set paste!

"EnhancedCommentify
"vmap <F8> <Esc><Esc>:call EnhancedCommentify('yes','comment',line("'<"),line("'>"))<CR>
"vmap <C-F8> <Esc><Esc>:call EnhancedCommentify('yes','decomment',line("'<"),line("'>"))<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Platform
function! MySys()
    return "linux"
endfunction

"Sets how many lines of history VIM har to remember
set history=500

set encoding=utf-8
set fileencodings=utf-8,chinese,gb2312,gbk,gb18030,big5,cp936,ucs-bom,latin-1


"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
"set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast Ex command
nnoremap ; :

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l


set t_Co=256
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term=="xterm"
	set t_Co=256
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif

"set term=xterm-256color
" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "Enable syntax hl
    " color scheme
    if has("gui_running")
        "set guioptions-=T
        "set guioptions-=m
        "set guioptions-=L
        "set guioptions-=r
        colorscheme 256-jungle 
    else
		colorscheme molokaidark
		"colorscheme 256-jungle
    endif " has
endif " exists(...)

syntax enable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
"set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>

"Ignore case when searching
set ignorecase

"Include search
set incsearch

"Highlight search things
set hlsearch

set cursorline

"Set magic on
"set magic

"No sound on errors.
set noerrorbells
set novisualbell
"set t_vb=

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
"set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

""""""""""""""""""""""""""""""
" lightline colorscheme
""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch to buffer according to file name
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <leader>es :tabnew<cr>:setl buftype=nofile<cr>
if MySys() == "linux"
map <leader>ec :tabnew ~/tmp/scratch.txt<cr>
else
map <leader>ec :tabnew $TEMP/scratch.txt<cr>
endif

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile
"set bufhidden=hide

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile * setfiletype txt 
au FileType txt setl lbr
au FileType txt setl tw=120
set iskeyword+=_,$,@,%,#,-

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"set formatoptions=tcrqn
"set smarttab
"set smartindent
"set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab	"show table style
set expandtab  "show space style



"Fast edit vimrc
if MySys() == 'linux'
	"Fast reloading of the .vimrc
	map <silent> <leader>ss :source ~/.vimrc<cr>
	"Fast editing of .vimrc
	map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>	
	"When .vimrc is edited, reload it
	autocmd! bufwritepost .vimrc source ~/.vimrc
elseif 	MySys() == 'windows'	
   	Set helplang	set helplang=cn	
	"Fast reloading of the	_vimrc
	map <silent> <leader>ss :source ~/_vimrc<cr>
	"Fast editing of	_vimrc
	map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>	
	"When _vimrc is edited, reload it
	autocmd! bufwritepost _vimrc source ~/_vimrc
endif

function! Kernel_Mode()
	set ts=8
	set shiftwidth=8
	set cc=80
endfunction
nmap <F4> :call Kernel_Mode()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""
"IDE
""""""""""""""""""""""""""
"clang completer
""""""""""""""""""""""""
"let g:clang_use_library = 1
"let g:clang_library_path='/mnt/nfsroot/alex.deng/opt/llvm-3.6/lib'

""""""""""""""""""""""""""""""
" file explorer setting
""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0


""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>
map <silent> <leader>nt :NERDTreeMirror<CR>
map <silent> <leader>nt :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" minibuffer setting
""""""""""""""""""""""""""""""
"let loaded_minibufexplorer = 1         " *** Disable minibuffer plugin
let g:miniBufExplorerMoreThanOne = 2   " Display when more than 2 buffers
let g:miniBufExplSplitToEdge = 1       " Always at top
let g:miniBufExplMaxSize = 3           " The max height is 3 lines
let g:miniBufExplMapWindowNavVim = 1   " map CTRL-[hjkl]
let g:miniBufExplUseSingleClick = 1    " select by single click
let g:miniBufExplModSelTarget = 1      " Dont change to unmodified buffer
let g:miniBufExplForceSyntaxEnable = 1 " force syntax on
let g:miniBufExplVSplit = 35
let g:miniBufExplSplitBelow = 0
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
"autocmd BufRead,BufNew :call UMiniBufExplorer

""""""""""""""""""""""""""""""
" bufexplorer setting
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 35  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerMaxHeight=13        " Max height


""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Process_File_Always=1
nmap <silent> <leader>tl :Tlist<cr>
nnoremap <silent> <F8> :Tlist<cr>

"""""""""""""""""""""""""""""""
" tagBar setting
""""""""""""""""""""""""""""""
" F8:  Switch on/off TagBar                                                                                
"nnoremap <silent> <F8> :TagbarToggle<CR>                                                                        
let g:tagbar_left = 1                                "在左侧                                              
"let g:tagbar_right = 1                                "在右侧                                              
let g:tagbar_width = 25                               "设置宽度  

""""""""""""""""""""""""""""""
" winmanager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 35
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
"autocmd BufWinEnter \[Buf\ List\] setl nonumber

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 35
nmap <silent> <leader>fe :Sexplore!<cr>


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lk <Plug>LookupFile<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
let _tags = &tags
try
   let &tags = eval(g:LookupFile_TagExpr)
   let newpattern = '\c' . a:pattern
   let tags = taglist(newpattern)
catch
   echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
   return ""
finally
   let &tags = _tags
endtry

" Show the matches for what is typed so far.
let files = map(tags, 'v:val["filename"]')
return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fencview Autodetect multiple encodings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fencview_autodetect = 1 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function echo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags -R --fields=+lS
set foldmethod=syntax
set foldlevel=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M - :%s/<C-V><cr>//ge

set updatetime=50


""""""""""""""""""""""""""""""
" Programing
""""""""""""""""""""""""""""""
" Visual
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

" Fast diff
cmap @vd vertical diffsplit 
set diffopt+=vertical

"ctags
nmap <silent> <leader>tg :!ctags -R -f .tags --c-kinds=+px --fields=+lS<cr><cr>
vmap <silent> <leader>tg :!ctags -R -f .tags --c-kinds=+px --fields=+lS<cr><cr>
"nmap <silent> <leader>tg :!ctags -R -f .tags  --fields=+lS<cr><cr>
"vmap <silent> <leader>tg :!ctags -R -f .tags  --fields=+lS<cr><cr>

"time
nmap <silent> <leader>tm :<ESC>i<C-R>=strftime("%Y-%m-%d-%H-%M-%S")<ESC><ESC>
vmap <silent> <leader>tm :<ESC>i<C-R>=strftime("%Y-%m-%d-%H-%M-%S")<ESC><ESC>

"omni
filetype plugin indent on 
set completeopt=longest,menu

"in file omni
inoremap <C-p> <C-x><C-n>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto add tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("tags")
"	execute 'set tags =tags'
endif
if filereadable(".tags")
"	execute 'set tags =.tags'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  if MySys() == "linux"
    "set csprg=/usr/bin/cscope
	set csprg="gtags-cscope"
  else
    set csprg=cscope
  endif
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory

  set csverb
endif

set cscopetag 
set cscopeprg='gtags-cscope'
let Gtags_OpenQuickfixWindow = 1
" 在左边打开窗口，默认为下边打开
let g:Gtags_VerticalWindow =  0
let g:GtagsCscope_Auto_Load = 1
let g:CtagsCscope_Auto_Map = 1
let g:Gtags_Auto_Update = 1
let GtagsCscope_Quiet = 1
nmap <silent> <leader>gt :Gtags<cr>


function! AutoLoadCTagsAndCScope()
	let max = 2
	let dir = './'
	let i = 0
	let break = 0
	while isdirectory(dir) && i < max
		if filereadable(dir . 'cscope.out') 
			execute 'cs add ' . dir . 'cscope.out'
			let break = 1
		endif
		if filereadable(dir . 'GTAGS') 
			execute 'cs add ' . dir . 'GTAGS'
			let break = 1
		endif
		if filereadable(dir . 'tags')
			execute 'set tags =' . dir . 'tags'
			let break = 1
		endif
		if filereadable(dir . '.tags')
			execute 'set tags =' . dir . '.tags'
			let break = 1
		endif
		if break == 1
			"execute 'lcd ' . dir
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endfunction

nmap <F10> :call AutoLoadCTagsAndCScope()<CR>call AutoLoadCTagsAndCScope()

function! AutoOutGtagsFiles()
    execute 'gtags' .
endfunction

nmap <F9> :call AutoOutGtagsFiles()<CR>call AutoOutGtagsFiles()

"跳转到光标所在函数的定义
"nmap <C-.> :Gtags<CR> 
nmap <silent> <leader>. :Gtags<CR><CR>
nmap <silent> <leader>r :Gtags -r<CR><CR>
nmap <silent> <leader>o :Gtags -s<CR><CR> 
nmap <silent> <leader>g :Gtags -g<CR><CR>
"搜索光标所在函数的引用
"nmap <A-r> :Gtags -r<cr><cr>

"查找C语言符号,即查找函数名、宏、枚举值等出现的地方
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找函数、宏、枚举等定义的位置,类似ctags所提供的功能
nmap <C->g :cs find g <C-R>=expand("<cword>")<CR><CR>
"查找本函数调用的函数
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"查找调用本函数的函数
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"查找指定的字符串
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找egrep模式,相当于egrep功能,但查找速度快多了
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找并打开文件,类似vim的find功能
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

nmap <silent><leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <silent><leader>ci :cs find i <C-R>=expand("<cfile>")<CR><CR>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"新的窗口中
nmap <C-+>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-+>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-+>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-+>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-+>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-+>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-+>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-+>d :scs find d <C-R>=expand("<cword>")<CR><CR>


"auto add auther info into file"header--------------------------------------
map <F4> ms:call AddAuthor()<cr>'s

function AddAuthor()
	let n=1
	while n < 5
		let line = getline(n)
		if line =~'^\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle()
endfunction

function UpdateTitle()
	normal m'
	execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
	normal "
	normal mk
	execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function AddTitle()
	call append(0,"/**********************************************************")
	call append(1," * Author        : haibing.an")
	call append(2," * Email         : haibing.an1991@gmail.com")
	call append(3," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
	call append(4," * Filename      : ".expand("%:t"))
	call append(5," * Description   : ")
	call append(6," * *******************************************************/")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"end auto add auther info into file"header--------------------------------------
