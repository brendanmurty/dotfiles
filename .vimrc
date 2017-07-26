set nocompatible

set paste
set ruler
set nostartofline
set number

syntax on
colorscheme desert

" Syntax highlighting

highlight Comment         ctermfg=DarkGrey guifg=#444444
highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold
highlight StatusLine      ctermbg=Black ctermfg=LightGrey
highlight LineNr          ctermbg=Black ctermfg=DarkGrey

" Highlight trailing whitespace

set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

" Text formatting

set autoindent
set smartindent
set nowrap
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set nosmarttab
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=80           " wrap at 80 chars by default
set virtualedit=block      " allow virtual edit in visual block

