return {
  'nvim-treesitter/nvim-treesitter',
  dir = vim.fn.stdpath('data') .. '/site/pack/hm/start/nvim-treesitter',

  -- lazy-load when opening a file
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    require('nvim-treesitter.configs').setup {
      -- Parsers are provided by nix (home/neovim.nix), not installed by treesitter
      auto_install = false,

      highlight = {
        enable = true,

        -- only use tree-sitter's highlighter
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
