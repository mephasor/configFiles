"==================================================
"|            VIM SHORTCUTS                       | 
"==================================================

" Mapleader bindings
let mapleader = ","
let g:mapleader = ","


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

" map 0 to the first char that is not blank
map 0 ^

" Fold code using the space key
nnoremap <space> za

" Vundle 
" You Complete me fixes
let g:ycm_autoclose_preview_window_after_completion=1
" g opens the declaration of function definition.
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" leader e opens up NerdTree
map <F9> :NERDTreeToggle<cr>
" F10 opens the tagbar
nmap <F10> :TagbarToggle<CR>
