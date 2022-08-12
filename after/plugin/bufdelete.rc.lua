local status, bufdelete = pcall(require, "bufdelete")
if not status then
  return
end

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>bc", "<Cmd>Bdelete<CR>")
map("n", "<Leader>bw", "<Cmd>Bwipeout<CR>")
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
