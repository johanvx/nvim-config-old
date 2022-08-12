" Auto open quickfix window
let g:asyncrun_open = 10

" Get cooperate with vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Provide asynchronous Gfetch and Gpush
command! -bang -bar -nargs=* Gpush execute 'AsyncRun<bang> -cwd=' .
          \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'AsyncRun<bang> -cwd=' .
          \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>
