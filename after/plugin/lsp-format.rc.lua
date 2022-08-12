local status, lsp_format = pcall(require, "lsp-format")
if not status then
  return
end

-- Options {{{
lsp_format.setup({
  lua = { force = true },
})
-- }}}

-- Maps {{{
local map = vim.keymap.set
map("n", "g=", "<Cmd>Format<CR>")
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
