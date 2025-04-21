local on_attach = require "plugins.setup.lsp.on_attach"

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
