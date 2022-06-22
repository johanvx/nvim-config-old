" Mapleader
nnoremap <space> <nop>
let mapleader = ' '
let maplocalleader = '\'

" Core {{{
noremap j gj
noremap k gk

" Leader {{{
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>q :confirm quit<cr>
nnoremap <leader>a :confirm quitall<cr>
nnoremap <leader>w :update<cr>
" }}}
" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 cc=+1 fdm=marker fdl=0:
