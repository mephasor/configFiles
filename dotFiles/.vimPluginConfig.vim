" ==================================
" |        Vundle Setup            |
" ==================================
" 
" Loading the plugins first in order to make all parameters available.
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==================================
" |        Plugins                 |
" ==================================
Plugin 'gmarik/Vundle.vim'

" Load all the plugins
source ~/Projects/configFiles/dotFiles/vim/loadPlugins.vim

" Plugins End
call vundle#end()
filetype plugin indent on


colorscheme solarized
$PATH=/home/kons/anaconda2/bin:$PATH
