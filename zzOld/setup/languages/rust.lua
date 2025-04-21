local common = require 'setup.languages.common'
-- local lsp = require 'lspconfig'
-- local rust_tools = require 'rust-tools'

-- rust_tools.setup({})
vim.g.rustaceanvim = {
  server = {
    on_attach = common.on_attach,
    -- capabilities = common.capabilities,
  },
}
-- lsp.rust_analyzer.setup {
--   on_attach = common.on_attach,
--   capabilities = common.capabilities
-- }

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
