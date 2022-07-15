local status, lspkind
status, lspkind = pcall(require, "lspkind")
if not status then
    return
end

-- Using nvim-cmp
local cmp
status, cmp = pcall(require, "cmp")
if not status then
    return
end

-- Options {{{
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      -- prevent the popup from showing more than provided characters (e.g 50
      -- will not show more than 50 characters)
      maxwidth = 50,

      -- The function below will be called before any actual modifications from
      -- lspkind so that you can provide more controls on popup customization.
      -- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- ...
        return vim_item
      end
    })
  }
})
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
