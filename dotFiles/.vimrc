" ======================================
" |              General               |
" ======================================

" History lines 
set history=2000

" Mapleader bindings
let mapleader = "," 
let g:mapleader=","


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
