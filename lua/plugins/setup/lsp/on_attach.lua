local function on_attach(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  bufmap('n', 'gD', vim.lsp.buf.declaration, 'LSP: Go to declaration')
  bufmap('n', 'gd', vim.lsp.buf.definition, 'LSP: Go to definition')
  bufmap('n', 'K', vim.lsp.buf.hover, 'LSP: Hover documentation')
  bufmap('n', 'gi', vim.lsp.buf.implementation, 'LSP: Go to implementation')
  bufmap('n', '<leader>rn', vim.lsp.buf.rename, 'LSP: Rename symbol')
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code action')
  bufmap('n', 'gr', vim.lsp.buf.references, 'LSP: List references')
  bufmap('n', '<leader>f', function() vim.lsp.buf.format { async = true } end,
    'LSP: Format buffer')
end

return on_attach
