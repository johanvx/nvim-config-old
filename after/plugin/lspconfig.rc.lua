if vim.g["lspconfig"] == nil then
  return
end

-- vim.lsp.set_log_level("debug")

local status, lspconfig, protocol, cmp_nvim_lsp, lsp_format, navic
status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

status, protocol = pcall(require, "vim.lsp.protocol")
if not status then
  return
end

status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
  return
end

status, lsp_format = pcall(require, "lsp-format")
if not status then
  return
end

status, navic = pcall(require, "nvim-navic")
if not status then
  return
end


-- Maps {{{
-- local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
-- buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- }}}

-- Customized on_attach {{{
-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  lsp_format.on_attach(client)
  navic.attach(client, bufnr)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- formatting
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

  --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
  }
end
-- }}}

-- General setup for LSPs {{{
-- Set up completion using nvim_cmp with LSP source
local capabilities = cmp_nvim_lsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local language_servers = vim.g["ensure_installed_lsp_list"]
for _, ls in ipairs(language_servers) do
  lspconfig[ls].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    other_fields = ...
  })
end
-- }}}

-- denols {{{
lspconfig.denols.setup({
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  capabilities = capabilities
})
-- }}}

-- tsserver {{{
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
  capabilities = capabilities
}
-- }}}

-- diagnosticls {{{
lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "json", "typescript",
                "typescriptreact", "css", "less", "scss", "pandoc" },
  init_options = {
    linters = {
      eslint = {
        -- command = "eslint_d",
        command = "./node_modules/.bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
        -- sourceName = "eslint_d",
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        },
        requiredFiles = { ".eslintrc.json" }
      },
    },
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint",
    },
    formatters = {
      -- eslint_d = {
      -- command = "eslint_d",
      --   rootPatterns = { ".git" },
      --   args = { "--stdin", "--stdin-filename", "%filename", "--fix-to-stdout" },
      --   rootPatterns = { ".git" },
      -- },
      prettier = {
        -- command = "prettier_d_slim",
        command = "./node_modules/.bin/prettier",
        rootPatterns = { ".git" },
        args = { "--stdin", "--stdin-filepath", "%filename" },
        requiredFiles = { "prettier.config.js" }
      }
    },
    formatFiletypes = {
      css = "prettier",
      javascript = "prettier",
      javascriptreact = "prettier",
      json = "prettier",
      less = "prettier",
      scss = "prettier",
      typescript = "prettier",
      typescriptreact = "prettier",
    }
  }
}
-- }}}

-- sumneko_lua {{{
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
-- }}}

-- texlab {{{
lspconfig.texlab.setup({
})
-- }}}

-- icon {{{
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ""
    }
  }
)
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 cc=+1 fdm=marker fdl=0:
