return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'folke/lazydev.nvim', ft = 'lua' },
  },

  config = function()
    require('lazydev').setup()

    -- Global config: capabilities for all servers
    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp')
          .default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    -- Enable all servers (custom settings live in lsp/*.lua files)
    vim.lsp.enable({
      'bashls',
      'clangd',
      'dockerls',
      'lua_ls',
      'nil_ls',
      'solidity_ls',
      'superhtml',
      'taplo',
      'texlab',
    })
  end,
}
