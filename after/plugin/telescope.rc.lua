local status, telescope, actions, builtin
status, telescope = pcall(require, "telescope")
if not status then
  return
end

status, actions = pcall(require, "telescope.actions")
if not status then
  return
end

status, builtin = pcall(require, "telescope.builtin")
if not status then
  return
end

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>f<Leader>", builtin.builtin)
map("n", "<Leader>fb", builtin.buffers)
map("n", "<Leader>fc", builtin.commands)
map("n", "<Leader>fd", builtin.diagnostics)
map("n", "<Leader>ff", builtin.find_files)
map("n", "<Leader>fg", builtin.grep_string)
map("n", "<Leader>fh", builtin.help_tags)
map("n", "<Leader>fk", builtin.keymaps)
map("n", "<Leader>fm", builtin.marks)
map("n", "<Leader>fr", builtin.oldfiles)
map("n", "<Leader>fs", builtin.lsp_document_symbols)
map("n", "<Leader>ft", builtin.treesitter)
map("n", "<Leader>/", builtin.live_grep)

map("n", "<Leader>ga", builtin.git_branches)
map("n", "<Leader>gb", builtin.git_bcommits)
map("n", "<Leader>gc", builtin.git_commits)
map("n", "<Leader>gf", builtin.git_files)
map("n", "<Leader>gs", builtin.git_status)
map("n", "<Leader>gw", builtin.git_stash)

map("n", "<Leader>e",
  "<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>")
map("n", "<Leader>fn",
  "<Cmd>lua require('telescope').extensions.notify.notify()<CR>")
-- }}}

-- Options {{{
telescope.setup({
  defaults = {
    -- @type "descending" (default) | "ascending"
    sorting_strategy = "ascending",
    -- @type "reset" (default) | "follow" | "row" | "closest" | "none"
    selection_strategy = "reset",
    -- @type "cycle" (default) | "limit"
    scroll_strategy = "limit",
    -- @type "horizontal" (default) | "center" | "cursor" | "vertical" | "flex"
    --       | "bottom_pane"
    layout_strategy = "flex",
    -- @type table, see telescope.layout
    -- Default: {
    --   bottom_pane = {
    --     height = 25,
    --     preview_cutoff = 120,
    --     prompt_position = "top"
    --   },
    --   center = {
    --     height = 0.4,
    --     preview_cutoff = 40,
    --     prompt_position = "top",
    --     width = 0.5
    --   },
    --   cursor = {
    --     height = 0.9,
    --     preview_cutoff = 40,
    --     width = 0.8
    --   },
    --   horizontal = {
    --     height = 0.9,
    --     preview_cutoff = 120,
    --     prompt_position = "bottom",
    --     width = 0.8
    --   },
    --   vertical = {
    --     height = 0.9,
    --     preview_cutoff = 40,
    --     prompt_position = "bottom",
    --     width = 0.8
    --   }
    -- }
    layout_config = {
      flex = {
        flip_columns = 100,
      },
      horizontal = {
        prompt_position = "top",
        preview_cutoff = 100,
        preview_width = 0.6,
        height = function(_, max, _) return max end,
        width = function(_, max, _) return max end
      },
      vertical = {
        preview_cutoff = 10,
        preview_height = 0.6,
        height = function(_, max, _) return max end,
        width = function(_, max, _) return max end
      },
    },
    -- @type table<string> | table<{layout_strategy, layout_config, previewer}>
    -- Default: { "horizontal", "vertical" }
    cycle_layout_list = { "horizontal", "vertical" },
    -- @type number: 0..=100
    winblend = 10,
    -- @type boolean
    wrap_results = false,
    -- @type string
    prompt_prefix = "> ",
    -- @type string
    selection_caret = "> ",
    -- @type string
    entry_prefix = "  ",
    -- @type string
    multi_icon = "+",
    -- @type "insert" (default) | "normal"
    initial_mode = "insert",
    -- @type true (default) | false
    border = true,
    -- @type { "hidden", "tail", "absolute", "smart", "shorten", "truncate" } Default: {}
    path_display = { "absolute" },
    -- @type table<string>: [8]
    -- Default: { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    -- @type function(picker): str
    -- Default: function that shows current count / all
    get_status_text = nil,
    -- @type true (default) | false
    hl_result_eol = true,
    -- @type false (default) | true
    dynamic_preview_title = true,
    -- @type string
    -- Default: "Results"
    results_title = "Results",
    -- @type string
    -- Default: "Prompt"
    prompt_title = "Prompt",
    -- @type table, see telescope.mappings
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },
    -- @type table | false
    -- history = false,
    -- @type table | false
    -- cache_picker = false,
    -- @type table | false
    preview = {
      treesitter = true,
      msg_bg_fillchar = "/",
      hide_on_startup = false,
    },
    vimgrep_arguments = { "rg", "--color=never", "--no-heading",
      "--with-filename", "--line-number", "--column",
      "--smart-case" },
    -- @type true (default) | false
    -- use_less = false,
    -- @type nil | table<key, value>
    -- Example: { COLORTERM = "truecolor" }, empty table is not allowed.
    set_env = nil,
    -- @type true | false
    color_devicons = true,
  },
  pickers = {
  },
  extensions = {
    file_browser = {
      -- @type "insert" (default) | "normal"
      initial_mode = "normal",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   ["i"] = {
      --     -- your custom insert mode mappings
      --   },
      --   ["n"] = {
      --     -- your custom normal mode mappings
      --   },
      -- },
    },
  },
})
-- }}}

-- Highlight {{{
local telescope_highlight_groups = {
  TelescopePromptNormal = { fg = "#f8f8f2", bg = "#282a36" },
  TelescopePromptBorder = { fg = "#6272a4", bg = "#282a36" },
  TelescopePromptTitle = { fg = "#bd93f9", bg = "#282a36" },
  TelescopePreviewTitle = { fg = "#bd93f9", bg = "#282a36" },
  TelescopeResultsTitle = { fg = "#bd93f9", bg = "#282a36" },
}

for highlight, colors in pairs(telescope_highlight_groups) do
  vim.api.nvim_set_hl(0, highlight, colors)
end
-- }}}

-- Extensions {{{
telescope.load_extension("file_browser")
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
