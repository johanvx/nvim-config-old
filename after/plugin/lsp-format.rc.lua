local status, lsp_format = pcall(require, "lsp-format")
if not status then
    return
end

lsp_format.setup({
})

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
