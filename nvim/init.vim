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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

""" Customize colors
func! s:my_colors_setup() abort
    hi Pmenu guibg=#d7e5dc gui=NONE
    hi PmenuSel guibg=#b7c7b7 gui=NONE
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#585858
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

50vs
terminal
