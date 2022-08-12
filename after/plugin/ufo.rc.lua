local status, ufo
status, ufo = pcall(require, "ufo")
if not status then
  return
end

-- Config {{{
vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true
vim.o.foldlevelstart = -1
-- }}}

-- Mappings{{{
local map = vim.keymap.set
map('n', 'zR', ufo.openAllFolds)
map('n', 'zM', ufo.closeAllFolds)
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

ufo.setup({
  -- global handler
  fold_virt_text_handler = handler,
  -- use treesitter as the main provider
  provider_selector = function(bufnr, filetype)
    return {'treesitter', 'indent'}
  end
})

-- buffer scope handler
-- will override global handler if it is existed
local bufnr = vim.api.nvim_get_current_buf()
ufo.setFoldVirtTextHandler(bufnr, handler)
-- }}}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
