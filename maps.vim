" Mapleader
nnoremap <space> <nop>
let mapleader = ' '
let maplocalleader = '\'

" Bare {{{
noremap j gj
noremap k gk
" }}}

" Leader {{{
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>q :confirm quit<cr>
nnoremap <leader>a :confirm quitall<cr>
nnoremap <leader>w :update<cr>
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
