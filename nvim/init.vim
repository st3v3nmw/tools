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
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Tabs
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
set nowrap
set formatoptions-=t

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

50vs
terminal

let g:airline_powerline_fonts = 1