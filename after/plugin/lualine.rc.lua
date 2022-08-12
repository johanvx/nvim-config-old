local status, lualine, navic

status, lualine = pcall(require, "lualine")
if not status then
    return
end

status, navic = pcall(require, "nvim-navic")
if not status then
    return
end

-- Options {{{
lualine.setup({
  options = {
    icons_enabled = true,
    theme = "dracula-nvim",
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {{
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }, {
      navic.get_location,
      cond = navic.is_available
    }, {
      "lsp_progress"
    }},
    lualine_x = {
      { "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " } },
      "encoding",
      "filetype"
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "fugitive" }
})
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
