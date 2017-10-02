" source ~/Projects/configFiles/dotFiles/vim/.vimPluginConfig.vim 

" ======================================
" |              General               |
" ======================================

" make suer the powerline shows up
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Use the system wide clipboard
set clipboard=unnamed

" encoding 
set encoding=utf-8

" History lines 
set history=2000

set nocompatible
filetype off

set listchars=tab:▸\ ,eol:¬
" ====================================
" |               UI                 |
" ====================================



" Show where the 80 char line is
set colorcolumn=80

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
set relativenumber 

set background=dark
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight current line
set cursorline

" Highlight current line color
"highlight ColorColumn ctermbg=7
"hi CursorLine ctermbg=7 guibg=7


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

" Return to the last edit location in a file when reopening
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" ==================================
" |            Editing             |
" ==================================

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




" ==================================
" |          Shortcuts             |
" ==================================
source ~/Projects/configFiles/dotFiles/vim/shortcuts.vim 
