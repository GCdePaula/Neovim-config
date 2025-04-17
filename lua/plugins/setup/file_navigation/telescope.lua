-- lua/plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',

    -- FZF sorter for lightning‑fast fuzzy‑search
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
