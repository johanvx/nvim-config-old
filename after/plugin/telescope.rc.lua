local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end

-- Maps {{{
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>sc", "<cmd>Telescope commands<cr>", opts)
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", opts)
map("n", "<leader>ss", "<cmd>Telescope builtin<cr>", opts)
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
