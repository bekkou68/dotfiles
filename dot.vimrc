" ----------------------------------------------------------------------
" Vundle
" ----------------------------------------------------------------------

" REQUIRE for starting Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle

" Vim Scripts repos (http://vim-scripts.org/vim/scripts.html)
" --- repos for others
Plugin 'L9' " -> FuzzyFinder
Plugin 'godlygeek/tabular' " -> plasticboy/vim-markdown
" --- repos combination
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
" --- repos
Plugin 'AutoComplPop' " deeply customizable.
Plugin 'FuzzyFinder'
Plugin 'OOP-javascript-indentation'
Plugin 'endwise.vim'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script' " only for coffee? for typescript?
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim.git'
Plugin 'surround.vim'
Plugin 'szw/vim-tags'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-scouter'
Plugin 'statianzo/vim-jade'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'yanktmp.vim'
Plugin 'Quramy/tsuquyomi' " typescript plugin. <Ctrl-]> for jumping to definition.

" REQUIRE for finishing Vundle
call vundle#end()
filetype plugin indent on




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
" Plugin Customization
" ----------------------------------------------------------------------

"
" AutoComplPop
"
" Reduce value because default one causes heavy performance.
let g:acp_behaviorKeywordLength = 5

"
" matchit
"
let b:match_words="<begin>:<end>"

"
" yanktmp
"
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>
let g:yanktmp_file = '/tmp/yanktmp'

"
" syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
" vim-markdown
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

"
" vim-tags
"
let g:vim_tags_ctags_binary='/usr/local/bin/ctags' " Use Homebrew ctags
let g:vim_tags_auto_generate = 0




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
" Make `:e not/existing/dir/foo.txt` to create 3 directories
" ----------------------------------------------------------------------
" see: http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END




" ----------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------
set nu           " Not display line numbers
set showmatch    " Show bracket pair
set hidden       " Buffer switchable with not-saved buffers
set scroll=1     " Set scroll number of ^u and ^d
set noswapfile   " Make no swap file
set visualbell   " No beep
set tags="./tmp/tags,tags"   " Path for ctags

map bf :e #<cr>  " Back to previous File
map co 0i#j    " Comment Out and move to next line

" Rename file
" Usage: On file you want to change, type :Rename [new_file_name]
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w

" After insert, automatically set nopaste
autocmd InsertLeave * set nopaste

" After these command, list shown, type an item, then jump to there
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

" Use ':' more than ';'
noremap ; :

" Jump to definition of code with ctags.
nnoremap <C-]> g<C-]>
