" Load Plugins using this file.

" Smart folding Plugin
Plugin 'tmhedberg/SimpylFold'

" Python indentation fixes
Plugin 'vim-scripts/indentpython.vim'

" Autocompletion (requires compilation in .vim/vundle/bundle/YouCompleteMe)
Bundle 'Valloric/YouCompleteMe'

" Python and others syntax check. Check happens on save
Plugin 'scrooloose/syntastic'

" Colorschemes
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'


" File explorer sidebar for vim
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Fuzzy search open
Plugin 'kien/ctrlp.vim'

" GIT integration in vim
Plugin 'tpope/vim-fugitive'
" GIT changes in file are displayed next to line numbers
Plugin 'airblade/vim-gitgutter'

" Fancy status bar for vim
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Taglist of all functions in the current file
Plugin 'majutsushi/tagbar'

" ack vim for searching in files
Plugin 'mileszs/ack.vim'

" Commentig and uncommenting in an easy fashion.
Plugin 'scrooloose/nerdcommenter'
