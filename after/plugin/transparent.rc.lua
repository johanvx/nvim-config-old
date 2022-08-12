local status, transparent = pcall(require, "transparent")
if not status then
  return
end

vim.g["transparent_enabled"] = false

-- Maps {{{
local map = vim.keymap.set
map("n", "<Leader>tt", transparent.toggle_transparent)
-- }}}

-- Options {{{
transparent.setup({
  enable = vim.g["transparent_enabled"], -- boolean: enable transparent

  -- table/string: additional groups that should be cleared
  -- In particular, when you set it to 'all', that means all available groups
  -- example of akinsho/nvim-bufferline.lua
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  -- extra_groups = "all",

  -- table: groups you don't want to clear
  exclude = { "DashboardHeader", "DashboardCenter", "DashboardShortCut", "DashboardFooter" },

  -- You can also set the groups option to override the default groups.
  --
  -- The default groups: Normal NormalNC Comment Constant Special Identifier
  -- Statement PreProc Type Underlined Todo String Function Conditional Repeat
  -- Operator Structure LineNr NonText SignColumn CursorLineNr.
  -- groups = {}
})
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
