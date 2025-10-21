local on_attach = require "config.lsp.on_attach"

return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'mrcjkb/rustaceanvim',
    { 'folke/lazydev.nvim', ft = 'lua' },
  },

  event = { 'BufReadPre', 'BufNewFile' },


  config = function()
    local lspconfig = require('lspconfig')

    -- Diagnostics display
    vim.diagnostic.config { virtual_text = true, signs = true, underline = true }

    local capabilities = require('cmp_nvim_lsp')
        .default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Mason & LSP installations
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'bashls', 'dockerls', 'superhtml', 'taplo', 'texlab',
        'clangd', 'lua_ls', 'rust_analyzer', 'solidity_ls',
      },
      automatic_installation = true,

      -- LSP server handlers
      handlers = {
        -- Default handler (all servers except Rust & Lua)
        function(server)
          if server == 'rust_analyzer' or server == 'lua_ls' then return end
          local opts = { on_attach = on_attach, capabilities = capabilities }

          if server == 'texlab' then
            opts.settings = {
              texlab = {
                build = {
                  executable = 'latexmk',
                  args       = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                  onSave     = true,
                },
                forwardSearch = {
                  executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
                  args       = { '-r', '%l', '%p', '%f' },
                },
                chktex = { onOpenAndSave = true },
              },
            }
          elseif server == 'clangd' then
            opts.capabilities.offsetEncoding = { 'utf-16' }
          end

          lspconfig[server].setup(opts)
        end,

        -- Lua handled by lazydev.nvim
        ['lua_ls'] = function()
          require('lazydev').setup()
          local opts = {
            on_attach    = on_attach,
            capabilities = capabilities,
            settings     = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
                telemetry   = { enable = false },
              },
            },
          }
          lspconfig.lua_ls.setup(opts)
        end,
      }
    }
  end,
}
