local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    return
end

-- Options {{{
autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" }
})
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
