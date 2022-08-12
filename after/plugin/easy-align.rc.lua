if vim.g['loaded_easy_align_plugin'] == nil then
  return
end

-- Start interactive EasyAlign for a motion/text object (e.g. <Plug>(EasyAlign)ip)
local map = vim.keymap.set
map("n", "<Leader>=", "<Plug>(EasyAlign)")

-- nnoremap <Leader>= <Plug>(EasyAlign)

-- Start interactive EasyAlign in visual mode (e.g. vip<Plug>(EasyAlign)
map("x", "<Leader>=", "<Plug>(EasyAlign)")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
