set nocompatible
filetype off
"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'klen/python-mode'
Plugin 'DoxygenToolkit.vim'
call vundle#end()

filetype plugin indent on
syntax on
"set autoread
set fileencodings=utf-8,gbk,ucs-bom,cp936
set showmatch        " Show matching brackets.
" set ignorecase       "搜索时不区分大小写, 如果键入了大写字母则区分大小写
" set smartcase        " Do smart case matching, 只有搜索关键字中出现一个大写字母时才区分大小写
set hlsearch         "搜索高亮, 按下 gd 就有效果
set incsearch        " Incremental search
set autowrite        " Automatically save before commands like :next and :make
"set hidden           " Hide buffers when they are abandoned
set virtualedit=block
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
" set mouse=nicr
set mouse=a        " Enable mouse usage (all modes)
if has('clipboard')
  set clipboard=unnamed
endif
set t_Co=256
colorscheme mycolor
" colorscheme solarized
set wildmenu      "下栏中显示<tab>预测项
set ruler
set nobackup
set laststatus=2
set showcmd        "在状态栏显示目前输入的命令
set backspace=indent,eol,start
set so=5          " Minimum lines to keep above and below cursor
" set scrolljump=-50              " Lines to scroll when cursor leaves screen
set go-=m  "不要菜单栏,工具栏(T),书签栏(B)
set go-=T
"set nowrap                      " Do not wrap long lines
" set nu
set relativenumber
" let &showbreak = '↳  '
set cpo+=n
set showbreak=↳\ \ \ 

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set synmaxcol=2000
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set list
set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
" set listchars=tab:»\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
" set listchars=tab:»·,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
set pastetoggle=<F12>
set autoindent
" set smartindent
"第一行, vim使用自动对起, 也就是把当前行的对起格式应用到下一行；
"第二行, 依据上面的对起格式, 智能的选择对起方式, 对于类似C语言编写上很有用
set expandtab       "tab用空格表示
set tabstop=2
set shiftwidth=2
set softtabstop=2   "backspace一次消除4个空格
set nojoinspaces    " Prevents inserting two spaces after punctuation on a join (J)
set fdm=marker
"set spell
"set guifont=文泉驿等宽微米黑\ 12
"set guifont=Courier_New:h12:cANSI
set guifont=Monaco:h12
if has('gui_running')
  set transparency=18
  set lines=32 columns=95
endif

"光标所在行只加一条下划线
set cursorline
hi cursorline gui=underline    guibg=NONE
hi cursorline cterm=underline  ctermbg=NONE
"hi cursorline ctermbg=NONE cterm=underline

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,longest,preview
set completeopt=menu,longest
"set complete=.,w,b,u  " CTRL-P/N 和 C-x-l 的扫瞄范围
highlight Pmenu    guibg=darkgrey  guifg=#1C1C1C
highlight PmenuSel guibg=lightgrey guifg=black
highlight Pmenu    ctermbg=246     ctermfg=234
highlight PmenuSel ctermbg=7       ctermfg=0

"see  :help last-position-jump
" comment it, because when open .js it can't support syntax, so you should type  g'"  to go previous position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" coderoot
let g:coderoot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if g:coderoot == ''
  let g:coderoot = substitute(system('hg root'), '[\n\r]', '', 'g')
endif


"move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Set mapleader
let mapleader = ","

nmap <Space> i<Space><Esc>l
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Buffer
nmap <leader>lb :buffers<CR>
nmap <leader>dc :bdelete %<CR>
nmap <leader>dp :bdelete #<CR>
" " Don't close window, when deleting a buffer
nmap <leader>dd :Bclose<CR>
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
    execute("bdelete ".l:currentBufNum)
  endif
endfunction

" location list
function! s:BufferCount()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! s:LListToggle()
  let buffer_count_before = s:BufferCount()
  silent! lclose

  if s:BufferCount() == buffer_count_before
    execute "silent! lopen"
  endif
endfunction
nmap <leader>ll :call <SID>LListToggle()<CR>

" Map <leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" rename word
nmap gr :%s/\C\<<C-R>=expand("<cword>")<CR>\>//gc<left><left><left>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"针对长行调整移动
set display=lastline
function! MapFlow()
  nmap j gj
  nmap k gk
  nmap 0 g0
  nmap ^ g^
  nmap $ g$
endfunction
function! UnMapFlow()
  unmap j
  unmap k
  unmap 0
  unmap ^
  unmap $
endfunction
command! MapFlow :call MapFlow()
command! UnMapFlow :call UnMapFlow()
" call MapFlow()

"make the column where the cursor is highlighted or not
nmap <leader>hc :call SetColorColumn()<CR>
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction

"To hex modle
let s:hexModle = "N"
function! ToHexModle()
  if s:hexModle == "Y"
    %!xxd -r
    let s:hexModle = "N"
  else
    %!xxd
    let s:hexModle = "Y"
  endif
endfunction
map <leader>hex :call ToHexModle()<CR>

" Ctags
" Make tags placed in tags file available in all levels of a repository
if g:coderoot != ''
  let &tags = &tags . ',' . g:coderoot . '/tags'
endif

" GNU GLOBAL
set cscopeprg=gtags-cscope
" add any database in current directory
function! GTAGS_add()
  set nocsverb
  if g:coderoot != '' && filereadable(g:coderoot . '/GTAGS')
    exe 'cs add ' . g:coderoot . '/GTAGS'
  elseif filereadable("GTAGS")
    cs add GTAGS
  endif
  set csverb
endfunction
" 映射 [[[2
" 查找C语言符号, 即查找函数名、宏、枚举值等出现的地方
nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找函数、宏、枚举等定义的位置, 类似ctags所提供的功能
nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找指定的字符串
nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找egrep模式, 相当于egrep功能, 但查找速度快多了
nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找并打开文件, 类似vim的find功能
nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 查找包含本文件的文件
nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 自己来输入命令
nmap cs<Space> :cs find

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"xml,html,php

" ---------- FileType ----------
autocmd FileType xml,html,php call FT_xml()
"编辑c文件
autocmd FileType c call FT_c()
"编辑cpp文件
autocmd FileType cpp call FT_cpp()
"编辑python
let python_highlight_all = 1
autocmd FileType python call FT_python()

function! FT_xml()
  "inoremap </ </<c-x><c-o><Esc>a
  set cuc
endfunction

function! FT_c()
  call GTAGS_add()
  set cin
  set cinoptions=:0
  "set makeprg=gcc\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
  if filereadable('./.ycm_extra_conf.py')
    let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
  elseif g:coderoot != '' && filereadable(g:coderoot . '/.ycm_extra_conf.py')
    let g:ycm_global_ycm_extra_conf = g:coderoot . '/.ycm_extra_conf.py'
  else
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf/c.ycm_extra_conf.py'
  endif
endfunction

function! FT_cpp()
  call GTAGS_add()
  set cin
  set cinoptions=:0,g0
  "set makeprg=g++\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
  if filereadable('./.ycm_extra_conf.py')
    let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
  elseif g:coderoot != '' && filereadable(g:coderoot . '/.ycm_extra_conf.py')
    let g:ycm_global_ycm_extra_conf = g:coderoot . '/.ycm_extra_conf.py'
  else
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf/cpp.ycm_extra_conf.py'
  endif
endfunction

function! FT_python()
  set smartindent
  setlocal wrap  " wrap ,although pymode is on
  if !has('python')
    let g:pymode = 0
  endif
  let g:pymode_rope = 0  " disable rope by default
  if isdirectory('.ropeproject')
    let g:pymode_rope = 1
  elseif isdirectory(g:coderoot . '/.ropeproject')
    let g:pymode_rope_project_root = g:coderoot
    let g:pymode_rope = 1
  endif
  set foldmethod=indent
  set foldlevel=99
  set cuc
  " Allow triple quotes in python
  let b:delimitMate_nesting_quotes = ['"', "'"]
  setlocal et ts=2 sw=2 sts=2
endfunction


" ---------- Plugins ----------
" YouCompleteMe
let g:ycm_key_detailed_diagnostics = '<leader>yd'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_show_diagnostics_ui = 0  "Don't use ycm's syntax checker
let g:ycm_always_populate_location_list = 1 "default 0
nnoremap <leader>js :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
function! s:YCM_syntax_toggle()
  let g:ycm_show_diagnostics_ui = xor(g:ycm_show_diagnostics_ui, 1)
endfunction
nmap <leader>s :SyntasticToggleMode<CR>
autocmd FileType c,cpp,objc,objcpp nmap <leader>s :call <SID>YCM_syntax_toggle()<CR>

" python-mode
let g:pymode_rope_complete_on_dot = 0  " solve conflict with YouCompleteMe
let g:pymode_breakpoint_bind = ''      " solve conflict with CtrlP
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_ignore = "W0401,"
      \."C901,"
      \."E201,E202,E222,E227,E228,E231,E265,E302,E401,E501,E731"

" vim-bufferline
" let g:bufferline_echo = 0

" vim-gitgutter
let g:gitgutter_enabled = 0
nmap <leader>g :GitGutterToggle<CR>

" delimitMate
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" ultisnipslet
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" CtrlP
nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" tagbar
let g:tagbar_sort = 0
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_ctags_bin = 'ctags'

" Tabular
nmap <leader>a& :Tabularize /&<CR>
vmap <leader>a& :Tabularize /&<CR>
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>
nmap <leader>a:: :Tabularize /:\zs<CR>
vmap <leader>a:: :Tabularize /:\zs<CR>
nmap <leader>a, :Tabularize /,<CR>
vmap <leader>a, :Tabularize /,<CR>
nmap <leader>a,, :Tabularize /,\zs<CR>
vmap <leader>a,, :Tabularize /,\zs<CR>
nmap <leader>a<Bar> :Tabularize /<Bar><CR>
vmap <leader>a<Bar> :Tabularize /<Bar><CR>

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

" vim-commentary
autocmd FileType c,cpp set commentstring=//\ %s

" airline
let g:airline_theme = "dark"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
