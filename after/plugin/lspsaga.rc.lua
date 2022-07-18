if vim.g["loaded_lspsaga"] == nil then
  return
end

local status, lspsaga = pcall(require, "lspsaga")
if not status then
  return
end

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>dj", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "<Leader>dk", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "<Leader>dl", "<Cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<Leader>dh", "<Cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "<Leader>dy", "<Cmd>Lspsaga yank_line_diagnostics<CR>")
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
map("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>")
map("n", "gp", "<Cmd>Lspsaga preview_definition<CR>")
map("n", "<Leader>r", "<Cmd>Lspsaga rename<CR>")
-- map("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>")
-- }}}

-- Options {{{

lspsaga.setup({
  error_sign = 'E',
  warn_sign = 'W',
  hint_sign = 'H',
  infor_sign = 'I',
  border_style = "round",
})
-- }}}


-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
