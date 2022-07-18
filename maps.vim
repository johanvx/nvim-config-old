" Mapleader
nnoremap <Space> <NOP>
let mapleader = ' '
let maplocalleader = '\'

" Bare {{{
noremap j gj
noremap k gk
noremap gh <Home>
noremap gl <End>

nnoremap ; <S-V>
nnoremap , <C-V>

nnoremap < <lt><lt>
nnoremap > >>

" Keep block selection after shifts in visual mode
xnoremap < <lt>gv
xnoremap > >gv
" }}}

" Leader {{{
" Common operations
nnoremap <Leader>wq <Cmd>confirm quit<CR>
nnoremap <Leader>wa <Cmd>confirm quitall<CR>
nnoremap <Leader>bw <Cmd>write<CR>

" Window motions
nnoremap <Leader>ww <C-W>w
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wl <C-W>l
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
