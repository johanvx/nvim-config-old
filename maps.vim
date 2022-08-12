" Mapleader
nnoremap <Space> <NOP>
let mapleader = ' '
let maplocalleader = '\'

" Non-leader {{{
" Movement
noremap j gj
noremap k gk
noremap gh <Home>
noremap gl <End>

" Keep block selection after shifts in visual mode
xnoremap < <lt>gv
xnoremap > >gv

" Easy move
inoremap <C-f> <Home>
inoremap <C-e> <End>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" }}}

" Leader {{{
" Common operations
nnoremap <Leader>wq <Cmd>confirm quit<CR>
nnoremap <Leader>wa <Cmd>confirm quitall<CR>

" Window motions
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wH <C-w>H
nnoremap <Leader>wJ <C-w>J
nnoremap <Leader>wK <C-w>K
nnoremap <Leader>wL <C-w>L

"Config
nnoremap <Leader>c <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>u <Cmd>source $MYVIMRC<CR>

" Plug
let g:plug_config = stdpath('config') . '/plug.vim'
nnoremap <Leader>pc <Cmd>PlugClean<CR>
nnoremap <Leader>pg <Cmd>PlugUpgrade<CR>
nnoremap <Leader>pi <Cmd>runtime g:plug_config \| PlugInstall<CR>
nnoremap <Leader>ps <Cmd>PlugStatus<CR>
nnoremap <Leader>pu <Cmd>PlugUpdate<CR>
" }}}

" vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
