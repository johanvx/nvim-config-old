" Status line {{{
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif
" }}}

" Abbrev {{{
cnoreabbrev g Git
cnoreabbrev gopen GBrowse
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 fdm=marker fdl=0:
