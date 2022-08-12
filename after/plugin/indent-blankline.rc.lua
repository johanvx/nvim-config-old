local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
  return
end

-- Options {{{
indent_blankline.setup({
  -- Specifies the character to be used as indent line. Not used if `char_list`
  -- is not empty.
  -- @type string
  -- Default: "│", Example: "|"
  char = "│",
  -- Specifies the character to be used as indent line for blanklines. Not
  -- used if `char_list_blankline` is not empty.
  -- @type string
  -- Default: "", Example: "┆"
  char_blankline = "",
  -- Specifies a list of characters to be used as indent line for each
  -- indentation level. Ignored if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "|", "¦", "┆", "┊" }
  char_list = {},
  -- Specifies a list of characters to be used as indent line for each
  -- indentation level on blanklines. Ignored if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "|", "¦", "┆", "┊" }
  char_list_blankline = {},
  -- Specifies the list of character highlights for each indentation level.
  -- Ignored if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "Error", "Function" }
  char_highlight_list = {},
  -- Specifies the character to be used as the space value in between indent
  -- lines when the line is blank.
  -- @type string
  -- Default: An empty space character, Example: " "
  space_char_blankline = " ",
  -- Specifies the list of space character highlights for each indentation
  -- level. Ignored if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "Error", "Function" }
  space_char_highlight_list = {},
  -- Specifies the list of space character highlights for each indentation level
  -- when the line is empty. Ignored if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "Error", "Function" }
  space_char_blankline_highlight_list = {},
  -- Use treesitter to calculate indentation when possible. Requires treesitter.
  -- @type boolean
  -- Default: false, Example: true
  use_treesitter = true,
  -- Specifies the maximum indent level to display.
  -- @type number
  -- Default: 10, Example: 4
  indent_level = 4,
  -- The maximum indent level increase from line to line. Set this option to 1
  -- to make aligned trailing multiline comments not create indentation.
  -- @type number
  -- Default: vim.g.indent_blankline_indent_level, Example: 1
  max_indent_increase = vim.g.indent_blankline_indent_level,
  -- Displays indentation in the first column.
  -- @type boolean
  -- Default: true, Example: false
  show_first_indent_level = true,
  -- Displays a trailing indentation guide on blank lines, to match the
  -- indentation of surrounding code. Turn this off if you want to use
  -- background highlighting instead of chars.
  -- @type boolean
  -- Default: true, Example: false
  show_trailing_blankline_indent = true,
  -- Displays the end of line character set by |listchars| instead of the indent
  -- guide on line returns.
  -- @type boolean
  -- Default: false, Example: true
  show_end_of_line = false,
  -- Displays the full fold text instead of the indent guide on folded lines.
  -- Note: there is no autocommand to subscribe to changes in folding. This
  --       might lead to unexpected results. A possible solution for this is to
  --       remap folding bindings to also call |IndentBlanklineRefresh|
  -- @type boolean
  -- Default: true, Example: false
  show_foldtext = true,
  -- Turns this plugin on or off.
  -- Note: the buffer version of this variable overwrites all other
  --       enabled/disalbed checks.
  -- @type boolean
  -- Default: true, Example: false
  enabled = true,
  -- When true, automatically turns this plugin off when |nolist| is set. When
  -- false, setting |nolist| will keep displaying indentation guides but removes
  -- whitespace characters set by |listchars|.
  -- @type boolean
  -- Default: false, Example: true
  disable_with_nolist = false,
  -- Specifies a list of |filetype| values for which this plugin is enabled.
  -- All |filetypes| are enabled if the value is an empty list.
  -- @type table
  -- Default: {}, Example: { "vim" }
  filetype = {},
  -- Specifies a list of |filetype| values for which this plugin is not enabled.
  -- Ignored if the value is an empty list.
  -- @type table
  -- Default: { "lspinfo", "packer", "checkhealth", "help", "man", "" },
  -- Example: { "help" }
  filetype_exclude = { "lspinfo", "packer", "checkhealth", "help", "man", "",
                       "dashboard" },
  -- Specifies a list of |buftype| values for which this plugin is not enabled.
  -- Ignored if the value is an empty list.
  -- @type table
  -- Default: { "terminal", "nofile", "quickfix", "prompt" },
  -- Example: { "terminal" }
  buftype_exclude = { "terminal", "nofile", "quickfix", "prompt" },
  -- Specifies a list of buffer names (file name with full path) for which this
  -- plugin is not enabled. A name can be regular expression as well.
  -- @type table
  -- Default: {}, Example: { "README.md", ".*\.py" }
  bufname_exclude = {},
  -- When on, if there is a single tab in a line, only tabs are used to
  -- calculate the indentation level. When off, both spaces and tabs are used to
  -- calculate the indentation level. Only makes a difference if a line has a
  -- mix of tabs and spaces for indentation.
  -- @type boolean
  -- Default: false, Example: true
  strict_tabs = false,
  -- When on, use treesitter to determine the current context. Then show the
  -- indent character in a different highlight.
  -- @type boolean
  -- Default: false, Example: true
  show_current_context = true,
  -- Applies the |hl-IndentBlanklineContextStart| highlight group to the first
  -- line of the current context. By default this will underline.
  -- Note: Requires https://github.com/nvim-treesitter/nvim-treesitter to be
  --       installed
  -- Note: You need to have set |gui-colors| and it depends on your terminal
  --       emulator if this works as expected. If you are using kitty and tmux,
  --       take a look at this article to make it work
  --       http://evantravers.com/articles/2021/02/05/curly-underlines-in-kitty-tmux-neovim/
  -- @type boolean
  -- Default: false, Example: true
  show_current_context_start = true,
  -- Shows show_current_context_start even when the cursor is on the same line
  -- @type boolean
  -- Default: true, Example: false
  show_current_context_start_on_current_line = true,
  -- Specifies the character to be used for the current context indent line. Not
  -- used if `context_char_list` is not empty. Useful to have a greater
  -- distinction between the current context indent line and others. Also useful
  -- in combination with `char` set to empty string (""), as
  -- this allows only the current context indent line to be shown.
  -- @type string
  -- Default: vim.g.indent_blankline_char, Example: "┃"
  context_char = vim.g.indent_blankline_char,
  -- Equivalent of `char_blankline` for `context_char`.
  -- @type string
  -- Default: "", Example: "┆"
  context_char_blankline = "",
  -- Equivalent of `char_list` for `context_char`.
  -- @type table
  -- Default: {}, Example: { "┃", "║", "╬", "█" }
  context_char_list = {},
  -- Equivalent of `char_list_blankline` for `context_char_blankline`.
  -- @type table
  -- Default: {}, Example: { "┃", "║", "╬", "█" }
  context_char_list_blankline = {},
  -- Specifies the list of character highlights for the current context at each
  -- indentation level. Ignored if the value is an empty list. Only used when
  -- `show_current_context` is active
  -- @type table
  -- Default: {}, Example: { "Error", "Warning" }
  context_highlight_list = {},
  -- Specifies the |extmarks| priority for chars.
  -- @type number
  -- Default: 1, Example: 50
  char_priority = 1,
  -- Specifies the |extmarks| priority for the context start.
  -- @type number
  -- Default: 10000, Example: 50
  context_start_priority = 10000,
  -- Specifies a list of lua patterns that are used to match against the
  -- treesitter |tsnode:type()| at the cursor position to find the current
  -- context. To learn more about how lua pattern work, see here:
  -- https://www.lua.org/manual/5.1/manual.html#5.4.1
  -- Only used when `show_current_context` is active.
  -- @type table
  -- Default: { "class", "^func", "method", "^if", "while", "for", "with", "try",
  --            "except", "arguments", "argument_list", "object", "dictionary",
  --            "element", "table", "tuple", "do_block" },
  -- Example: { "^if" }
  context_patterns = { "class", "^func", "method", "^if", "while", "for", "with",
                       "try", "except", "arguments", "argument_list", "object",
                       "dictionary", "element", "table", "tuple", "do_block" },
  -- Instead of using `context_patterns`, use the current scope defined by
  -- nvim-treesitter as the context.
  -- @type boolean
  -- Default: false, Example: true
  use_treesitter_scope = true,
  -- Specifies a map of patterns set in `context_patterns` to highlight groups.
  -- When the current matching context pattern is in the map, the context will
  -- be highlighted with the corresponding highlight group. Only used when
  -- `show_current_context` is active
  -- @type table
  -- Default: {}, Example: { "function": "Function" }
  context_pattern_highlight = {},
  -- Sets the buffer of extra lines before and after the current viewport that
  -- are considered when generating indentation and the context.
  -- @type number
  -- Default: 10, Example: 20
  viewport_buffer = 10,
  -- Turns deprecation warning messages off.
  -- @type boolean
  -- Default: false, Example: true
  disable_warning_message = false,
})
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
