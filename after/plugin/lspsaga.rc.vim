if !exists('g:loaded_lspsaga')
  finish
endif

lua << EOF
local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

lspsaga.init_lsp_saga({
  error_sign = 'E',
  warn_sign = 'W',
  hint_sign = 'H',
  infor_sign = 'I',
  border_style = "round",
})

EOF

" nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
" nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
" nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>
" nnoremap <silent> gr <Cmd>Lspsaga rename<CR>

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
