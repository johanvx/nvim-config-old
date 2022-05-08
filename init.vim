" Init autocmd
autocmd!

" Set script encoding
scriptencoding utf-8

" Stop loading config if it's on tiny or small
if !1
    finish
endif

" Disable vi compatibility
set nocompatible

silent function! MACOS()
    return has('macunix')
endfunction

silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
    return has('win32') || has('win64')
endfunction

" Platform {{{
if MACOS()
    runtime macos.vim
endif

if WINDOWS()
    runtime windows.vim
endif
" }}}

" General {{{
syntax enable " Switch on syntax highlighting
set encoding=utf-8
set clipboard+=unnamedplus
set fileencodings=utf-8,default,latin1
set maxmempattern=1000000
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
" }}}

" UI {{{
set background=dark " Assume a dark background by default
set backspace=indent,eol,start
set cmdheight=2
set cursorline
set foldenable " Auto fold code
set foldlevel=100
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " Last window will always has a status line
set lazyredraw " Disable autoredraw while executing macros, use `:redraw` to force an update
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:↴
set matchtime=2 " Tenths of a second to show the matching paren
set mouse=a " Automatically enable mouse usage
set mousehide " Hide the mouse cursor while typing
set noshowmode " Do not display the current mode
set number
set scrolloff=10
set showcmd
set showmatch " Show matching brackets
set smartcase
set splitbelow
set splitright
set title
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu " Show list instead of just completing
set wildmode=full

highlight clear SignColumn
highlight clear LineNr

if has('termguicolors')
    set termguicolors
endif
" }}}

" Formatting {{{
filetype plugin indent on
set autoindent
set expandtab
set formatoptions+=r
set nojoinspaces
set nowrap
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
" }}}

" Plugins {{{
runtime plug.vim
" }}}

" Colorscheme {{{
colorscheme dracula
" }}}

" Maps {{{
runtime maps.vim
" }}}

" File types {{{
autocmd BufNewFile,BufRead *.tex set filetype=tex
" }}}

" Extras {{{
set exrc
" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 fdm=marker fdl=0:
