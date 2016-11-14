" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


"===============plugin and color list=============
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"plugin
Plugin 'gmarik/vundle'
Plugin 'taglist.vim'
Plugin 'minibufexplorerpp'
Plugin 'a.vim'
Plugin 'ctags.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-Commenter'
Plugin 'grep.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mbriggs/mark.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
"color
Plugin 'darkburn'

call vundle#end()
"===============plugin and color list=============


"===============basic config======================
filetype plugin indent on
syntax on
set number
set autoindent
set smartindent
set hlsearch
set showmatch
set ruler
set incsearch         
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set nobackup
set hls
set showcmd
set ignorecase
set smartcase
set t_Co=256
colorscheme darkburn
set backspace=indent,eol,start
set expandtab
set showmatch
set noerrorbells
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=gb18030
"set termencoding=utf-8
"set encoding=utf-8
"set encoding=gbk

set foldmethod=syntax
set foldlevel=99
set foldcolumn=0

let mapleader=','

imap "" ""<left>
imap '' ''<left>
imap <> <><left>
imap () ()<left>
imap [] []<left>
imap {} {}<left>
"imap {} {}<left><cr><cr><up><tab>

nmap <space> za
imap <a-4>  <esc>:r !date<cr>o

func Smart_y()
   exec "TlistClose"
   exec "cclose"
   if bufexists("(clewn)_console")
      bwipeout (clewn)_console
   endif
   if bufexists("(clewn)_dbgvar")
      bwipeout (clewn)_dbgvar
   endif
   exec "x"
endfunc

imap q  <esc>:call Smart_y()<cr>
nmap q  :call Smart_y()<cr>

imap s  <esc>:w<cr>
nmap s  :w<cr>
vmap s  :w<cr>
"===============basic config======================

"===============python PEP8===============
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix
let python_highlight_all=1
"===============python PEP8===============

"===============plugins config===============
"======syntastic setting start======
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']

highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>
"======syntastic setting end======

"======flake8 setting start======
let g:pyflakes_use_quickfix = 1
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
"Auto-check file for errors on write: 
let g:PyFlakeOnWrite = 1 
""List of checkers used: 
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes' 
"Default maximum complexity for mccabe: 
let g:PyFlakeDefaultComplexity=10 
""List of disabled pep8 warnings and errors: 
let g:PyFlakeDisabledMessages = 'E501' 
"Default height of quickfix window: 
let g:PyFlakeCWindow = 6 
""Whether to place signs or not: 
let g:PyFlakeSigns = 1 
"Maximum line length for PyFlakeAuto command 
let g:PyFlakeMaxLineLength = 100 
""Visual-mode key command for PyFlakeAuto 
let g:PyFlakeRangeCommand = 'Q' 
"======flake8 setting end======

"======taglist setting start===========
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=30
let Tlist_Use_Horiz_Window=0
map <silent> <leader>tl :TlistToggle<CR>
"======taglist setting end===========

"======nerdtree setting start===========
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 
nmap <F2> :NERDTree  <CR>
"======nerdtree setting end===========

"======The-NERD-Commenter setting start===========
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
"======The-NERD-Commenter setting end===========

"======minbufexplorer setting start======
"<C-Tab> <C-S-Tab>
let g:miniBufExplMapCTabSwitchBufs = 1
"<C-h j k l>
let g:miniBufExplMapWindowNavVim = 1
"<C-left right up down>
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMaxSize = 1
"let g:miniBufExplorerMoreThanOne = 1
"======minbufexplorer setting end======

"===========A setting start===========
".C Switch to .H
nnoremap <silent> <F12> :A<CR>
"===========A setting end===========

"===========grep setting start===========
nnoremap <silent> <F3> :Rgrep<CR>
"===========grep setting end===========

"===========NERD_commenter setting start===========
nmap <leader>, ,c<space>
vmap <leader>, ,c<space>
"===========NERD_commenter setting end===========

"======mark setting start===========
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex 
"======mark setting end===========

"======doxygen setting start===========
map <F10> :DoxAuthor
map <F11> :Dox<cr>
"map <F9> :DoxBlock<cr>
"======doxygen setting end===========

"======rainbow_parentheses setting start===========
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"======rainbow_parentheses setting end===========

"===========easymotion setting start================
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map ff <Plug>(easymotion-s)
"map <Leader>b <Plug>(easymotion-b)
"map <Leader>h <Plug>(easymotion-linebackward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>. <Plug>(easymotion-repeat)
"===========easymotion setting end ================

"===========airline setting start================
set laststatus=2
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ 
         "\%{&encoding}\ %c:%l/%L%)\ 
let g:airline_section_b = '%{strftime("%Y-%m-%d %A %H:%M:%S")}'
"===========airline setting end================

"===========ctrlp setting start================
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
"===========ctrlp setting end================

"===========SimpylFold setting start================
let g:SimpylFold_docstring_preview=1
"===========SimpylFold setting start================

"===========YCM setting start================
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_strings = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"===========YCM setting start================

"===============plugins config===============
