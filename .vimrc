"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
"execute pathogen#infect()

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"My Bundle Here

"original repos on github
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'wesleyche/SrcExpl'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'mattn/calendar-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'SirVer/ultisnips'
Bundle 'mattn/emmet-vim'
"Bundle 'suan/vim-instant-markdown'

"vim-scripts repos
Bundle 'L9'
Bundle 'a.vim'
Bundle 'bufexplorer.zip'
Bundle 'ctrlp.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'grep.vim'
Bundle 'The-NERD-tree'
Bundle 'Rainbow-Parenthesis'
Bundle 'Tagbar'
Bundle 'YankRing.vim'
Bundle 'EnhCommentify.vim'
Bundle 'matchit.zip'
Bundle 'repeat.vim'
Bundle 'vimwiki'
Bundle 'Mark--Karkat'
Bundle 'Syntastic'
Bundle "TagHighlight"

"non github repos
"Bundle 'git://git.test.com/test.git'

"git repos on local machine
"Bundle 'file:///Users/test/path/to/plugin

filetype plugin indent on

"
" Brief help
"  :BundleList              - list configured bundles      
"  :BundleInstall(!)        - install(update) bundles
"  :BundleSearch(!) foo     - search(or refresh cache first) for foo
"  :BundleClean(!)          - confirm(or auto-approve) removal of unused bundles
"

function! MySys()
    if has("win32")
        return "win32"
    elseif has("unix")
        return "unix"
    else
        return "mac"
    endif
endfunction
"Set shell to be bash
if MySys() == "unix" || MySys() == "mac"
    set shell=bash
else
    "I have to run win32 python without cygwin
    "set shell=E:cygwininsh
endif

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype on
if has("eval") && v:version>=600
    filetype plugin on
    filetype indent on
endif

"Set to auto read when a file is changed from the outside
if exists("&autoread")
    set autoread
endif

"Have the mouse enabled all the time:
if exists("&mouse")
    set mouse=a
endif

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
"nmap <leader>x :xa!<cr>
nmap <Leader>w :w!<cr>
"Fast exit
nmap <Leader>q :q<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
if MySys()=="unix"
    if v:version<600
        if filereadable(expand("$VIM/syntax/syntax.vim"))
            syntax on
        endif
    else
        syntax on
    endif
else
    syntax on
endif

"if you use vim in tty,
"'uxterm -cjk' or putty with option 'Treat CJK ambiguous characters as wide' on
if exists("&ambiwidth")
    set ambiwidth=double
endif

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    if MySys()=="win32"
        "start gvim maximized
        if has("autocmd")
            au GUIEnter * simalt ~x
        endif
    endif
    "let psc_style='cool'
    if v:version > 601
        set background=dark
        colorscheme solarized
    endif
else
    if v:version > 601
        set background=dark
        colorscheme solarized
"        colorscheme desert
    endif
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

"Highlight current
if has("gui_running")
    if exists("&cursorline")
        set cursorline
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetype
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
"set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracet
set showmatch

"How many tenths of a second to blink
set mat=8

"Highlight search thing
set hlsearch

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Format the statusline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Smart way to move btw. window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"set guifont=monospace\ 13
if has("win32")
    if has("gui_running")
        set encoding=utf-8
        lang messages zh_CN.UTF-8
    else
        set encoding=chinese
        set termencoding=chinese
    endif
endif

if has("gui_running")
    if has("unix")
        set guifont=monospace\ 13
    elseif has("win32")
        set guifont=Bitstream_Vera_Sans_Mono:h13
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
    endif
endif

set foldmethod=indent

set nu

"powerline
set laststatus=2
set encoding=utf8
set t_Co=256
let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_symbols='fancy'

"func! s:rainbow_parenthsis_load()
"	call rainbow_parenthsis#LoadSquare ()
"	call rainbow_parenthsis#LoadRound ()
"	call rainbow_parenthsis#Activate ()
"endfunc
"
"au Syntax csc call s:rainbow_parenthsis_load()
"let g:miniBufExplMapWindowNavVim = 1

"minibufexplore
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMoreThanOne=0

"winmanger
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<CR>

"a.vim
nnoremap <silent> <F12> :A<CR>

"NERD tree
let NERDTreeWinPos="left"
let NERDTreeWinSize=30
nmap <F6> :NERDTreeToggle<CR> :TagbarToggle<CR>

"TagBar
let g:tagbar_width=30


"TagList
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"nnoremap <silent> <F4> :Tlist<CR>

"SrcExpl
nmap <F8> :SrcExplToggle<CR>
let g:SrcExpl_winHeight=8
let g:SrcExpl_refreshTime=100
let g:SrcExpl_jumpKey="<ENTER>"
nmap <C-I> <C-W>j:call g:SrcExpl_Jump()<CR>
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_pluginList=[
		\ "__Tag_List__",
		\ "_NERD-tree_",
		\ "Source_Explorer"
	\]
let g:SrcExpl_searchLocalDef=1
let g:SrcExpl_isUpdateTags=0
"let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsCmd="ctags --langmap=make:+.make --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey="<F11>"
"let g:SrcExpl_prevDefKey="<F3>"
"let g:SrcExpl_nextDefKey="<F4>"

"make
nnoremap <F5> :call CompileMake()<CR>

func! CompileMake()
	exec "w"
	exec "!make"
endfunc

"设置折叠
set foldmethod=indent

"YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']

"Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre="@Synopsis "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="---------------------------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------------------------"
let g:DoxygenToolkit_authorName="PH22"
let g:DoxygenToolkit_licenseTag="PH22 license"

"indent-guides
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
let g:indent_guides_guide_size = 1
"let g:indent_guides_space_guides = 0
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2

"CtrlP
set runtimepath^=/root/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode=0
nnoremap <c-\> :CtrlP<CR>

"Ack
nnoremap <silent> <F3> :Ack<CR>

"Grep
nnoremap <silent> <F4> :Grep<CR>
let Grep_Default_Options = '-iRn --exclude-dir=\.svn --exclude-from=/root/.grep_exclude_files'

"Buffer Explore
nmap <F2> <leader>be

"Vimwiki
let g:vimwiki_list = [{'path':'/home/ph22/wiki/wiki_md',
            \'syntax':'markdown',
            \'ext':'.md'}]
"重新映射vimwiki的快捷键，避免<Leader>w保存的时候会卡一会儿"
nmap <Leader>vv <Plug>VimwikiIndex
nmap <Leader>vt <Plug>VimwikiTabIndex
nmap <Leader>vs <Plug>VimwikiUISelect
nmap <Leader>vi <Plug>VimwikiDiaryIndex
nmap <Leader>v<Leader>v <Plug>VimwikiMakeDiaryNote
nmap <Leader>v<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>vh <Plug>Vimwiki2HTML
nmap <Leader>vhh <Plug>Vimwiki2HTMLBrowse
nmap <Leader>v<Leader>i <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>vd <Plug>VimwikiDeleteLink
nmap <Leader>vr <Plug>VimwikiRenameLink
"unmap <Leader>ww
"unmap <Leader>wt
"unmap <Leader>ws
"unmap <Leader>wi
"unmap <Leader>w<Leader>w
"unmap <Leader>w<Leader>t
"unmap <Leader>wh
"unmap <Leader>whh
"unmap <Leader>w<Leader>i
"unmap <Leader>wd
"unmap <Leader>wr
"显示行尾的空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"打开日历空间
map ca :Calendar<cr>

"Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['c', 'javascript'],
                           \ 'passive_filetypes': ['c'] }

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
