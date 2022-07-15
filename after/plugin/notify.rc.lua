local status, notify = pcall(require, "notify")
if not status then
    return
end

-- Options {{{
notify.setup({
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = "info",
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 5000
})
vim.notify = notify
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
