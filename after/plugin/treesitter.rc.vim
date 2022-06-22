if !exists('g:loaded_nvim_treesitter')
  echom "Treesitter not loaded"
  finish
endif

lua << EOF
local status, treesitterconfigs = pcall(require, "nvim-treesitter.configs")
treesitterconfigs.setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss",
    "c",
    "cpp",
    "rust",
  },
  autotag = {
    enable = true,
  }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF

" vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
