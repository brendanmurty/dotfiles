set nocompatible

" General

set paste
set ruler
set nostartofline
set number
set undolevels=1000
set history=200
set noerrorbells
set visualbell

" Syntax highlighting

filetype plugin on
syntax on

" Text formatting

set autoindent
set smartindent
set nowrap
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set nosmarttab
set formatoptions+=n
set textwidth=80
set virtualedit=block
set ignorecase
set smartcase

" Show trailing whitespace

set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

