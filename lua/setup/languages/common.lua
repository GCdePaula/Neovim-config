local vim_keymap = vim.keymap
local vim_lsp = vim.lsp
local vim_lsp_buf = vim_lsp.buf
local vim_inspect = vim.inspect

-- Autocomplete capabilities
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.default_capabilities(
  vim_lsp.protocol.make_client_capabilities()
)

-- General configurations
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim_keymap.set('n', 'gD', vim_lsp_buf.declaration, opts)
  vim_keymap.set('n', 'gd', vim_lsp_buf.definition, opts)
  vim_keymap.set('n', 'K', vim_lsp_buf.hover, opts)
  vim_keymap.set('n', 'gi', vim_lsp_buf.implementation, opts)
  vim_keymap.set('n', '<C-k>', vim_lsp_buf.signature_help, opts)
  vim_keymap.set('n', '<leader>wa', vim_lsp_buf.add_workspace_folder, opts)
  vim_keymap.set('n', '<leader>wr', vim_lsp_buf.remove_workspace_folder, opts)
  vim_keymap.set('n', '<leader>wl', function()
    vim_inspect(vim_lsp_buf.list_workspace_folders())
  end, opts)
  vim_keymap.set('n', '<leader>D', vim_lsp_buf.type_definition, opts)
  vim_keymap.set('n', '<leader>rn', vim_lsp_buf.rename, opts)
  vim_keymap.set('n', 'gr', vim_lsp_buf.references, opts)
  vim_keymap.set('n', '<leader>ca', vim_lsp_buf.code_action, opts)
  vim_keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim_keymap.set('n', '<leader>f', vim.lsp.buf.formatting, opts)
end

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
