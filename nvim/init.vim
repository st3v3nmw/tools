" Terminal
tnoremap <Esc> <C-\><C-n>
set shell=/bin/fish

" Plugins
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Splitting
set splitbelow
set splitright

" Use system clipboard
set clipboard+=unnamedplus

" Text Wrapping
set wrap
set linebreak

" One dark theme
syntax enable
colorscheme onedark

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Misc
filetype plugin indent on
set termguicolors

" Map CTRL S to :w
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

50vs
terminal
