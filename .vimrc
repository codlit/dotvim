set nocompatible
filetype off
"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"plugins that Vundle manages
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mbbill/undotree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hdima/python-syntax'
call vundle#end()
filetype plugin indent on
syntax on
"set autoread
set fileencodings=utf-8,gbk,ucs-bom,cp936
set showmatch        " Show matching brackets.
set ignorecase       "搜索时不区分大小写, 如果键入了大写字母则区分大小写
set smartcase        " Do smart case matching,只有搜索关键字中出现一个大写字母时才区分大小写
set hlsearch         "搜索高亮, 按下 gd 就有效果
set incsearch        " Incremental search
set autowrite        " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set virtualedit=block
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
"set mouse=nicr
set mouse=a        " Enable mouse usage (all modes)
if has('clipboard')
    set clipboard=unnamed
endif
"set guifont=文泉驿等宽微米黑\ 12
"set guifont=Courier_New:h12:cANSI
set guifont=Monaco:h12
if has("gui_macvim") && has('gui_running')
    set transparency=8
    set lines=32 columns=95
endif

set t_Co=256
colorscheme mycolor
" let g:solarized_termcolors = 256
" colorscheme solarized
set wildmenu      "下栏中显示<tab>预测项
set ruler
set nobackup
set nu
set laststatus=2
set showcmd        "在状态栏显示目前输入的命令
set backspace=indent,eol,start
set so=2 "当光标在窗口上下边界时距离边界2行即开始滚屏
set go-=m  "不要菜单栏,工具栏(T),书签栏(B)
set go-=T
"set nowrap                      " Do not wrap long lines
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set synmaxcol=5000
set scrolljump=-50              " Lines to scroll when cursor leaves screen
set scrolloff=0                 " Minimum lines to keep above and below cursor
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
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')

"set spell
"光标所在行只加一条下划线
set cursorline
hi cursorline gui=underline    guibg=NONE
hi cursorline cterm=underline  ctermbg=NONE
"hi cursorline ctermbg=NONE cterm=underline

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

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

" undotree
nmap <leader>u :UndotreeToggle<CR>

" syntastic
let g:syntastic_python_flake8_quiet_messages = { 'regex': '\m\E501\|E201\|E202' }

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_quiet_warnings = 1
nmap <leader>s :SyntasticToggleMode<CR>
" TODO: add nmap to toggle Errors window
"nmap <leader>e xxx

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


" Ctags
"ctags omnicppcomplete
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src
"在对C++文件进行补全时, OmniCppComplete插件需要tag文件中包含C++的额外信息, 因此上面的ctags命令不同于以前我们所使用的.
"它专门为C++语言生成一些额外的信息, 上述选项的含义如下：
"--c++-kinds=+p   "为C++文件增加函数原型的标签
"--fields=+iaS    " 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
"--extra=+q       " 为标签增加类修饰符。注意, 如果没有此选项, 将不能对类成员补全
set tags=./tags;/,~/.vimtags
" Make tags placed in .git/tags file available in all levels of a repository
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" " cscope -Rbkq  (replaced by gtags) {{{
" "   -R:在生成索引文件时, 搜索子目录树中的代码
" "   -b:只生成索引文件, 不进入cscope目录
" "   -k:生成索引文件时, 不搜索/usr/include目录
" "   -q:生成cscope.in.out和cscope.po.out文件, 加快cscope的索引速度
" "   cscope setting [[[1
" if has("cscope") && executable("cscope")
"     " 设置 [[[2
"     set csto=1
"     set cst
"     set cscopequickfix=s-,c-,d-,i-,t-,e-
"     " add any database in current directory
"     function! Lilydjwg_csadd()
"         set nocsverb
"         if g:gitroot != '' && filereadable(g:gitroot . '/.git/cscope.out')
"             exe 'cs add ' . g:gitroot . '/.git/cscope.out'
"         endif
"         if filereadable(expand('%:h:p') . "/cscope.out")
"             exe 'cs add ' . expand('%:h:p') . '/cscope.out'
"         elseif filereadable(expand('%:h:p') . "/../cscope.out")
"             exe 'cs add ' . expand('%:h:p') . '/../cscope.out'
"         elseif filereadable("cscope.out")
"             cs add cscope.out
"         endif
"         set csverb
"     endfunction
"     autocmd BufRead *.c,*.cpp,*.h call Lilydjwg_csadd()
"     " 映射 [[[2
"     " 查找C语言符号, 即查找函数名、宏、枚举值等出现的地方
"     nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
"     " 查找函数、宏、枚举等定义的位置, 类似ctags所提供的功能
"     nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
"     " 查找本函数调用的函数
"     nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
"     " 查找调用本函数的函数
"     nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
"     " 查找指定的字符串
"     nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
"     " 查找egrep模式, 相当于egrep功能, 但查找速度快多了
"     nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
"     " 查找并打开文件, 类似vim的find功能
"     nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"     " 查找包含本文件的文件
"     nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"     " 生成新的数据库 "重新在ft_*.vim中定义
"     "nmap csn :lcd %:p:h<CR>:!my_cscope<CR>
"     " 自己来输入命令
"     nmap cs<Space> :cs find
" endif  "}}}

" GNU GLOBAL
set cscopeprg=gtags-cscope
" add any database in current directory
function! GTAGS_add()
    set nocsverb
    if g:gitroot != '' && filereadable(g:gitroot . '/GTAGS')
        exe 'cs add ' . g:gitroot . '/GTAGS'
    elseif filereadable("GTAGS")
        cs add GTAGS
        set nu
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


set fdm=marker
" vim:fdm=marker:fmr={{{,}}}
" vim:fdm=marker:fmr=[[[,]]]

" NERD Tree
let NERDChristmasTree=1
"let NERDTreeAutoCenter=1
"">>>>{path}
"let   NERDTreeBookmarksFile=$VIM.'NerdBookmarks.txt'
"let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=31
map <silent> <F3> :NERDTreeToggle<CR>

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,longest,preview
set completeopt=menu,longest
"set complete=.,w,b,u  " CTRL-P/N 和 C-x-l 的扫瞄范围
highlight Pmenu    guibg=darkgrey  guifg=#1C1C1C
highlight PmenuSel guibg=lightgrey guifg=black
highlight Pmenu    ctermbg=246     ctermfg=234
highlight PmenuSel ctermbg=7       ctermfg=0

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" let g:ycm_register_as_syntastic_checker = 0 "Don't use ycm for Syntastic
let g:ycm_show_diagnostics_ui=0
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
nnoremap <leader>js :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

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
call MapFlow()

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

" Tabularize
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


"xml,html,php
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

" html5.vim
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

function! FT_c()
    set cin
    "set makeprg=gcc\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
    map <F9> :w!<CR>:make<CR><Esc>:cl<CR>
    set makeprg=gcc\ -Wall\ -D__DEBUG__\ -o\ %<\ %
    "以下针对libpcap,libnet
    "map <F9> :w!<CR>:make -lpcap -lnet<CR><C-L>:cl<CR>
    map <F8> :!gdb %<<CR><C-L>
    if has('win32')
        map <C-F9> :!start cmd /c "%< && pause \|\| pause"<CR><CR><C-L>
    else
        if has('gui_macvim')
            map <C-F9> :!time ./%<<CR>
        elseif has('gui')
            map <C-F9> :!gnome-terminal --command="bash -c 'time \"./%<\"; read -p \"  Press Enter...\"'"&<CR><CR><C-L>
        else
            map <C-F9> :!time ./%<<CR>
        endif
    endif
    if g:gitroot != '' && filereadable(g:gitroot . '/.git/ycm_extra_conf.py')
        let g:ycm_global_ycm_extra_conf = g:gitroot . '/.git/ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/extra/c.ycm_extra_conf.py'
    endif
endfunction

function! FT_cpp()
    set cin
    "set makeprg=g++\ -Wall\ -D__DEBUG__\ -o\ %<.exe\ %
    map <F9> :w!<CR>:make<CR><Esc>:cl<CR>
    set makeprg=g++\ -Wall\ -D__DEBUG__\ -o\ %<\ %
    "以下针对libpcap,libnet
    "map <F9> :w!<CR>:make -lpcap -lnet<CR><C-L>:cl<CR>
    map <F8> :!gdb %<<CR><C-L>
    if has('win32')
        map <C-F9> :!start cmd /c "%< && pause \|\| pause"<CR><CR><C-L>
    else
        if has('gui')
            map <C-F9> :!gnome-terminal --command="bash -c 'time \"./%<\"; read -p \"  Press Enter...\"'"&<CR><CR><C-L>
        else
            map <C-F9> :!time ./%<<CR>
        endif
    endif
    if g:gitroot != '' && filereadable(g:gitroot . '/.git/ycm_extra_conf.py')
        let g:ycm_global_ycm_extra_conf = g:gitroot . '/.git/ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/extra/cpp.ycm_extra_conf.py'
    endif
endfunction

function! FT_python()
    set smartindent
    if !has('python')
        let g:pymode = 0
    endif
    set foldmethod=indent
    set foldlevel=99
    set cuc
    "Execute buffer with
    "map <F5> :w<CR>:!python %<CR>
    " Allow triple quotes in python
    let b:delimitMate_nesting_quotes = ['"', "'"]
    set tabstop=4
endfunction

" DoxygenToolkit
let g:doxygen_enhanced_color=1
"let g:DoxygenToolkit_authorName="nemopwn"
"let g:DoxygenToolkit_briefTag_funcName="yes"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"

"au BufRead,BufNewFile *.md set filetype=markdown

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

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

