" ======================================
" |              General               |
" ======================================

" Use the system wide clipboard
set clipboard=unnamed

" encoding 
set encoding=utf-8

" History lines 
set history=2000

" Mapleader bindings
let mapleader = "," 
let g:mapleader=","

set nocompatible
filetype off
" ====================================
" |               UI                 |
" ====================================



"Make sure you never get to the bottom.
set so=7

" If a file is changed from the outside, reload
set autoread
" Make the backspace key do what you want. 
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show coordinates 
set ruler 

"Command bar
set cmdheight=2

" Search stuff
set hlsearch

set incsearch

" Enable re
set magic

" ====================================
" |        Color and Fonts           | 
" ====================================

syntax enable
set number 

colorscheme murphy
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" ====================================
" |      Text, Tab and indent        | 
" ====================================

" Use spaces for tabs
set expandtab

" smart tabs
set smarttab

" 1 tab is 4 spaces long
set shiftwidth=4
set tabstop=4

" Indendation
set ai " auto indent
set si " smart indent 
set wrap " warparound lines

" Disable autoindent on key stroke
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" ==================================
" |    Moving, Tabs and Buffers    |
" ==================================

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Return to the last edit location in a file when reopening
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" ==================================
" |            Editing             |
" ==================================

map 0 ^

" Delete trailing spaces on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" Add proper PEP8 indentation
au BufNewFile,BufRead *.py " Affects py files only
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" You Complete me fixes
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ==================================
" |        Vundle Setup            |
" ==================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==================================
" |        Plugins                 |
" ==================================
Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}




" Plugins End
call vundle#end()
filetype plugin indent on
