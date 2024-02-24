local lsp = require 'lspconfig'
local common = require 'setup.languages.common'
local rust_tools = require 'rust-tools'

rust_tools.setup({})

lsp.rust_analyzer.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
