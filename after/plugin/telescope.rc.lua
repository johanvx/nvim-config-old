local status, telescope = pcall(require, "telescope")
if not status then
    return
end

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>s<Leader>", "<Cmd>Telescope builtin<CR>")
map("n", "<Leader>sb", "<Cmd>Telescope buffers<CR>")
map("n", "<Leader>sc", "<Cmd>Telescope commands<CR>")
map("n", "<Leader>sd", "<Cmd>Telescope diagnostics<CR>")
map("n", "<Leader>sf", "<Cmd>Telescope find_files<CR>")
map("n", "<Leader>sg", "<Cmd>Telescope grep_string<CR>")
map("n", "<Leader>sh", "<Cmd>Telescope help_tags<CR>")
map("n", "<Leader>sk", "<Cmd>Telescope keymaps<CR>")
map("n", "<Leader>sm", "<Cmd>Telescope marks<CR>")
map("n", "<Leader>sn", "<Cmd>Telescope notify<CR>")
map("n", "<Leader>ss", "<Cmd>Telescope lsp_document_symbols<CR>")

map("n", "<Leader>ga", "<Cmd>Telescope git_branches<CR>")
map("n", "<Leader>gb", "<Cmd>Telescope git_bcommits<CR>")
map("n", "<Leader>gc", "<Cmd>Telescope git_commits<CR>")
map("n", "<Leader>gf", "<Cmd>Telescope git_files<CR>")
map("n", "<Leader>gs", "<Cmd>Telescope git_status<CR>")
map("n", "<Leader>gw", "<Cmd>Telescope git_stash<CR>")

map("n", "<Leader>/", "<Cmd>Telescope live_grep<CR>")
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
