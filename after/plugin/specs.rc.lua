local status, specs = pcall(require, "specs")
if not status then
  return
end

-- Options {{{
specs.setup({
  show_jumps  = true,
  min_jump = 10,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects 
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 10,
    winhl = "PMenu",
    fader = specs.pulse_fader,
    resizer = specs.shrink_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
})
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
