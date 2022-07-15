local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  return
end

-- Options {{{
lsp_installer.setup({
  -- automatically detect which servers to install (based on which servers are
  -- set up via lspconfig)
  automatic_installation = true,
  ensure_installed = vim.g["ensure_installed_lsp_list"],
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
