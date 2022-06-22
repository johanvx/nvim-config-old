local status, ufo = pcall(require, "ufo")
if not status then
  return
end

local status, async = pcall(require, "async")
if not status then
  return
end

-- Config {{{
vim.wo.foldcolumn = "1"
-- vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldlevel = 20
vim.wo.foldenable = true
-- }}}

-- nvim lsp as LSP client {{{
-- tell the server the capability of foldingRange
-- nvim hasn't added foldingRange to default capabilities, users must add it
-- manually
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = { "bashls", "clangd", "rust_analyzer", "tsserver",
                           "eslint", "ltex", "tailwindcss", "vimls", "jsonls",
                           "sumneko_lua" }

for _, ls in ipairs(language_servers) do
    lspconfig[ls].setup({
        capabilities = capabilities,
        other_fields = ...
    })
end
-- }}}

-- Options {{{
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument,
            -- need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

-- global handler
ufo.setup({
    fold_virt_text_handler = handler
})

-- buffer scope handler
-- will override global handler if it is existed
local bufnr = vim.api.nvim_get_current_buf()
ufo.setFoldVirtTextHandler(bufnr, handler)
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
