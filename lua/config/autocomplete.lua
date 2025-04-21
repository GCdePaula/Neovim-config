return {
  'hrsh7th/nvim-cmp',

  event = 'InsertEnter',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',    -- LSP completion source
    'hrsh7th/cmp-buffer',      -- buffer words source
    'hrsh7th/cmp-path',        -- filesystem paths source
    'uga-rosa/cmp-dictionary', -- dictionary source for prose
  },

  config = function()
    local cmp = require('cmp')

    -- Use a better completion menu
    vim.opt.completeopt = 'menu,menuone,noselect'

    -- Basic mappings
    cmp.setup {
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>']      = cmp.mapping.confirm { select = true },
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        -- { name = 'buffer' },
      }),
    }

    -- Prose: enable dictionary and buffer word completions
    cmp.setup.filetype({ 'markdown', 'text', 'tex' }, {
      sources = cmp.config.sources({
        { name = 'dictionary' },
        { name = 'buffer' },
      }),
    })
  end,
}
