local status, lualine = pcall(require, "lualine")
if not status then
    return
end

lualine.setup({
    options = {
        theme = "dracula"
    }
})

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
