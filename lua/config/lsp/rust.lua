local on_attach_ = require "config.lsp.on_attach"

local function on_attach(client, bufnr)
  on_attach_(client, bufnr)

  local group = vim.api.nvim_create_augroup("LspRustFmt", { clear = false })
  vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }

  vim.api.nvim_create_autocmd("BufWritePre", {
    group    = group,
    buffer   = bufnr,
    callback = function()
      vim.lsp.buf.format { bufnr = bufnr, async = true }
    end,
  })
end

return {
  'mrcjkb/rustaceanvim',

  lazy = false,
  init = function()
    local capabilities = require('cmp_nvim_lsp')
        .default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- configure rustaceanvim via globals
    vim.g.rustaceanvim = {
      server = {
        on_attach    = on_attach,
        capabilities = capabilities,
      },
    }
  end,
}
