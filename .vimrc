set nocompatible
filetype off
"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
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
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'HTML-AutoCloseTag'
Plugin 'othree/html5.vim'
Plugin 'klen/python-mode'
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
"set mouse=nicr
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
set so=5  "当光标在窗口上下边界时距离边界2行即开始滚屏
" set scrolljump=-50              " Lines to scroll when cursor leaves screen
" set scrolloff=0                 " Minimum lines to keep above and below cursor
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
"set autoindent
set smartindent
"第一行, vim使用自动对起, 也就是把当前行的对起格式应用到下一行；
"第二行, 依据上面的对起格式, 智能的选择对起方式, 对于类似C语言编写上很有用
set tabstop=4
set shiftwidth=4
set expandtab       "tab用空格表示
set softtabstop=4   "backspace一次消除4个空格
set nojoinspaces    " Prevents inserting two spaces after punctuation on a join (J)
set fdm=marker
" vim:fdm=marker:fmr={{{,}}}
" vim:fdm=marker:fmr=[[[,]]]
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

" gitroot
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')

"move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Set mapleader
let mapleader = ","
let g:mapleader = ","

nmap <Space> i<Space><Esc>l
inoremap jj <ESC>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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
" Make tags placed in .git/tags file available in all levels of a repository
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/tags'
endif

" GNU GLOBAL
set cscopeprg=gtags-cscope
" add any database in current directory
function! GTAGS_add()
    set nocsverb
    if g:gitroot != '' && filereadable(g:gitroot . '/GTAGS')
        exe 'cs add ' . g:gitroot . '/GTAGS'
    elseif filereadable("GTAGS")
        cs add GTAGS
    endif
    set csverb
endfunction
autocmd BufRead *.c,*.cpp,*.h call GTAGS_add()
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
    set cin
    "set makeprg=gcc\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
    if g:gitroot != '' && filereadable(g:gitroot . '/.ycm_extra_conf.py')
        let g:ycm_global_ycm_extra_conf = g:gitroot . '/.ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/extra/c.ycm_extra_conf.py'
    endif
endfunction

function! FT_cpp()
    set cin
    "set makeprg=g++\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
    if g:gitroot != '' && filereadable(g:gitroot . '/.ycm_extra_conf.py')
        let g:ycm_global_ycm_extra_conf = g:gitroot . '/.ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/extra/cpp.ycm_extra_conf.py'
    endif
endfunction

function! FT_python()
    set smartindent
    setlocal wrap  " wrap ,although pymode is on
    if !has('python')
        let g:pymode = 0
    endif
    if g:gitroot != ''
        let g:pymode_rope = 1
        let g:pymode_rope_ropefolder = g:gitroot . '/.ropeproject'
    else
        let g:pymode_rope = 0  " disable rope
    endif

    set foldmethod=indent
    set foldlevel=99
    set cuc
    " Allow triple quotes in python
    let b:delimitMate_nesting_quotes = ['"', "'"]
    " set tabstop=4
endfunction


" ---------- Plugins ----------
" syntastic
" using python-mode to check syntax
" let g:syntastic_python_flake8_quiet_messages = { 'regex': '\m\'.
"             \'E201\|E202\|E222\|E228\|E231\|E265\|'.
"             \'E501\|'.
"             \'F403'}
let g:syntastic_mode_map = { "passive_filetypes": ["python"] }
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_quiet_warnings = 1
nmap <leader>s :SyntasticToggleMode<CR>
" TODO: add nmap to toggle Errors window
"nmap <leader>e xxx

" python-mode
let g:pymode_rope_complete_on_dot = 0  " solve conflict with YouCompleteMe
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_ignore = "W0401,"
                         \."C901,"
                         \."E201,E202,E222,E227,E228,E231,E265,E401,E501"

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
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(swp|exe|so|dll|zip)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" tagbar
let g:tagbar_sort = 0
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_type_javascript = { 'ctagsbin' : '/usr/local/bin/jsctags' }

"进行Tlist的设置,放到有中文的目录里无法生成
"命令:TlistUpdate可以更新tags
map <silent> <S-F4> :Tlist<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里, 所以可以直接执行
"let Tlist_Use_Right_Window=1 "让窗口显示在右边, 0的话就是显示在左边
"let Tlist_Show_One_File=0
""让taglist可以同时展示多个文件的函数列表, 如果想只有1个, 设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件, 函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时, 自动推出vim
"是否一直处理tags.1:处理;0:不处理
"let Tlist_Process_File_Always=0 "不是一直实时更新tags, 因为没有必要
"let Tlist_Inc_Winwidth=0
"set ut=2000     "2000ms更新, 可针对taglist

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" let g:ycm_register_as_syntastic_checker = 0  "Don't use ycm for Syntastic
" let g:ycm_show_diagnostics_ui=0  "Don't use ycm's syntastic checker
let g:ycm_collect_identifiers_from_comments_and_strings = 1
nnoremap <leader>js :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Tabular
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

" vim-commentary
autocmd FileType c,cpp set commentstring=//\ %s

" airline
" let g:airline_theme='base16'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0

""statusline  {{{
"set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "File+path
"set statusline+=%2*%y                                     "FileType
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
""set statusline+=%5*\ %{&spelllang}\                       "Spellanguage
"set statusline+=%5*%{fugitive#statusline()}               "fugitive#statusline
"set statusline+=%8*\ %=row:%l/%L(%p%%)\                   "Rownumber/total (%)
"set statusline+=%9*\ col:%02c\                            "Colnr
"set statusline+=%0*\ %m%r%w\ %P\                          "Modified? Readonly? Top/bot.
"hi User1 guifg=#ffdad8  guibg=#880c0e
"hi User1 ctermfg=White  ctermbg=DarkRed
"hi User2 guifg=#000000  guibg=#F4905C
"hi User2 ctermfg=Black  ctermbg=DarkYellow
"hi User3 guifg=#292b00  guibg=#f4f597
"hi User3 ctermfg=Black  ctermbg=LightYellow
"hi User4 guifg=#112605  guibg=#aefe7B
"hi User4 ctermfg=Black  ctermbg=LightGreen
"hi User5 guifg=#051d00  guibg=#7dcc7d
"hi User5 ctermfg=Black  ctermbg=Green
"hi User7 guifg=#ffffff  guibg=#880c0e   gui=bold
"hi User7 ctermfg=White  ctermbg=DarkRed cterm=bold
"hi User8 guifg=#ffffff  guibg=#5b7fbb
"hi User8 ctermfg=White  ctermbg=27
"hi User9 guifg=#ffffff  guibg=#810085
"hi User9 ctermfg=White  ctermbg=Magenta
"hi User0 guifg=#ffffff  guibg=#094afe
"hi User0 ctermfg=Black  ctermbg=Grey
" }}}
