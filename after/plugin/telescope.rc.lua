local status, telescope = pcall(require, "telescope")
if not status then
    return
end

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>sb", "<Cmd>Telescope buffers<CR>")
map("n", "<Leader>sc", "<Cmd>Telescope commands<CR>")
map("n", "<Leader>sd", "<Cmd>Telescope diagnostics<CR>")
map("n", "<Leader>sf", "<Cmd>Telescope find_files<CR>")
map("n", "<Leader>sg", "<Cmd>Telescope live_grep<CR>")
map("n", "<Leader>sh", "<Cmd>Telescope help_tags<CR>")
map("n", "<Leader>sk", "<Cmd>Telescope keymaps<CR>")
map("n", "<Leader>ss", "<Cmd>Telescope builtin<CR>")
map("n", "<Leader>sn", "<Cmd>Telescope notify<CR>")
-- }}}

-- Options {{{
telescope.setup({
  defaults = {
    mappings = {
    }
  },
  pickers = {
  },
  extensions = {
  },
})
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 fdm=marker fdl=0:
