if !exists('g:loaded_easy_align_plugin')
  finish
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap gi <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap gi <Plug>(EasyAlign)

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
