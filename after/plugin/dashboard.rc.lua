local status, dashboard = pcall(require, "dashboard")
if not status then
  return
end

local plugin_setup = function(loaded_plugin, setup_table)
  for key, value in pairs(setup_table) do
    loaded_plugin[key]= value
  end
end

local custom_center_element = function(icon, desc, shortcut, action)
  return { desc = string.format("  %-30s", desc),
    icon = icon .. " ",
    shortcut = string.format("%20s", shortcut),
    action = action }
end

local nvim_version = function()
  local version = vim.version()
  return "v" .. version.major .. "." .. version.minor .. "." .. version.patch
end

-- Options {{{
plugin_setup(dashboard, {
  -- @type nil | table<string> | function(): table<string>
  custom_header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "[ " .. nvim_version() .. " ]"
  },
  -- @type table<{ desc: string, [icon: nil | string, icon_hl: {fg, bg},
  --               shortcut: nil | string,
  --               action: nil | string | function(): string] }>
  custom_center = {
    custom_center_element("", "New file", "", "DashboardNewFile"),
    custom_center_element("", "Recent files", "<Leader>fr", "Telescope oldfiles"),
    custom_center_element("פּ", "File browser", "<Leader>e", "Telescope file_browser"),
    custom_center_element("", "Find files", "<Leader>ff", "Telescope find_files"),
    custom_center_element("", "Live grep", "<Leader>/", "Telescope live_grep"),
    custom_center_element("", "Help tags", "<Leader>fh", "Telescope help_tags"),
    custom_center_element("", "More useful pickers", "<Leader>f<Leader>", "Telescope builtin"),
    custom_center_element("", "Edit config", "<Leader>c", "edit $MYVIMRC"),
    custom_center_element("ﮮ", "Update plugins", "<Leader>pu", "PlugUpdate"),
    custom_center_element("", "Quit", "<Leader>wq", "confirm quit")
  },
  -- @type nil | table | function(): table
  custom_footer = { os.date("%Y-%m-%d %H:%M:%S") },
  -- @type string | function
  -- db.preview_file_Path
  -- @type number
  -- db.preview_file_height
  -- @type number
  -- db.preview_file_width
  -- @type string
  -- db.preview_command
  -- @type string
  confirm_key = "<Enter>",
  -- @type boolean
  hide_statusline = true,
  -- @type boolean
  hide_tabline = true,
  -- Directory to store the session file
  -- @type string
  -- session_directory
  -- @type number
  header_pad = 1,
  -- @type number
  center_pad = 1,
  -- @type number
  footer_pad = 1
})
-- }}}

-- Highlight group {{{
local dashboard_highlight_group = {
  DashboardHeader = { fg = "#bd93f9" },
  DashboardCenter = { fg = "#8be9fd" },
  DashboardShortCut = { fg = "#ff79c6" },
  DashboardFooter = { fg = "#ffb86c" },
}
for hlgroup, hldef in pairs(dashboard_highlight_group) do
  vim.api.nvim_set_hl(0, hlgroup, hldef)
end
-- }}}

-- Command {{{
--
-- If you like use `enew` to create file, use this command which wraps enew
-- and restores the statsuline and tabline
--
-- DashboardNewFile
--
-- SessionSave, SessionLoad
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
