return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      dir = vim.fn.stdpath('data') .. '/site/pack/hm/start/telescope-fzf-native.nvim',
    },
  },

  config = function()
    local telescope = require 'telescope'
    local telescope_builtin = require 'telescope.builtin'

    telescope.setup {
      pickers = {
        find_files = { theme = "ivy" },
        live_grep  = { theme = 'dropdown' },
      },
      extensions = {
        fzf = {}
      }
    }

    -- load fzf native extension
    telescope.load_extension('fzf')

    vim.keymap.set("n", "<space>f", telescope_builtin.find_files)
    vim.keymap.set("n", "<space>g", telescope_builtin.live_grep)
  end,
}
