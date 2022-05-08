if !exists('LspColors')
  finish
endif

lua << EOF
local status, LspColors = pcall(require, "lsp-colors")
if (not status) then
  return
end
-- Options {{{
local dracula = {
  background = "#282A36",
  foreground = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50FA7B",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
}

LspColors.setup {
  Error = dracula.red
  Warning = dracula.yellow
  Information = dracula.cyan
  Hint = dracula.green
}
-- }}}
EOF

" vim: set sw=2 ts=2 sts=2 et tw=80 fdm=marker fdl=0:
