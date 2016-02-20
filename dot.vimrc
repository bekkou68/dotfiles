" === Plugin Preparation
" * Set up Vundle (see https://github.com/gmarik/vundle)
"   * git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"   * :PluginInstall
"
" === Plugin Cleaning
" * :PluginClean


" ----------------------------------------------------------------------
" Vundle
" ----------------------------------------------------------------------
set nocompatible " Use extended functions of Vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Vim Scripts repos (http://vim-scripts.org/vim/scripts.html)
" --- Depended repos
Plugin 'L9' " -> FuzzyFinder
Plugin 'godlygeek/tabular' " -> plasticboy/vim-markdown
" --- repos
Plugin 'AutoComplPop'
Plugin 'FuzzyFinder'
Plugin 'OOP-javascript-indentation'
Plugin 'endwise.vim'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'surround.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-scouter'
Plugin 'tpope/vim-rails'
Plugin 'unite.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'yanktmp.vim'

call vundle#end() " required
filetype plugin indent on " required

let g:vim_markdown_folding_disabled = 1


" ----------------------------------------------------------------------
" File types
" ----------------------------------------------------------------------
filetype indent on " Indent depends on file type


" ----------------------------------------------------------------------
" Character codes
" ----------------------------------------------------------------------
set encoding=utf-8                      " Default
set fileencodings=utf-8,eucjp,iso2022jp " Select automatically
set fileformats=unix,dos,mac            " 改行コードの自動認識


" ----------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------
" matchit
let b:match_words="<begin>:<end>"

" yanktmp
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>
let g:yanktmp_file = '/tmp/yanktmp'


" ----------------------------------------------------------------------
" Space
" ----------------------------------------------------------------------
set tabstop=2    " Tab width
set shiftwidth=2 " Shift width
set expandtab    " Insert half space instead of tab


" ----------------------------------------------------------------------
" Statuses
" ----------------------------------------------------------------------
set laststatus=2 " Display status line always
set showcmd      " Show inputting command to status line

" Display character code and break to status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


" ----------------------------------------------------------------------
" Searchings
" ----------------------------------------------------------------------
set incsearch
set ignorecase

" Find project
map fp :!grep -r --exclude-dir=log --exclude-dir=tmp --color=auto

" Center cursor when searched
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz


" ----------------------------------------------------------------------
" Highlights
" ----------------------------------------------------------------------
syntax on    " Enable highlights
set hlsearch " Highlight searched strings

" Highlight EOL space
highlight EOLSpace ctermbg=white
match EOLSpace /\s\+$/


" ----------------------------------------------------------------------
" Command Line
" ----------------------------------------------------------------------
" Emacs-like movings
:cnoremap <C-A> <Home>
:cnoremap <C-B> <Left>
:cnoremap <C-D> <Delete>
:cnoremap <C-F> <Right>
:cnoremap <C-K> <Delete>


" ----------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------
set nonu         " Not display line numbers
set showmatch    " Show bracket pair
set hidden       " Buffer switchable with not-saved buffers
set scroll=1     " Set scroll number of ^u and ^d
set noswapfile   " Make no swap file
set visualbell   " No beep

map bf :e #<cr>  " Back to previous File
map co 0i#j    " Comment Out and move to next line

" Rename file
" Usage: On file you want to change, type :Rename [new_file_name]
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w

" After insert, automatically set nopaste
autocmd InsertLeave * set nopaste

" After these command, list shown, type an item, then jump to there
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

" Number of times to use ':' is more than ';'
noremap ; :
