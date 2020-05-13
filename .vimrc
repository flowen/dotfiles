
" colors and syntax

"colorscheme northpole

colorscheme apprentice

" spaces and tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab

" UI settings
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Search
set path+=**       " search in child directories by `find ${filemame}` autocomplete works w <tab>
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>:

" Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>

" plugin manager vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

"runtime /pack/tpope/start/sensible/sensible.vim


