return {
  'nvim-treesitter/nvim-treesitter',
  dir = vim.fn.stdpath('data') .. '/site/pack/hm/start/nvim-treesitter',

  -- lazy-load when opening a file
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    -- Parsers are provided by nix (home/neovim.nix), not installed by treesitter
    -- Modern nvim-treesitter no longer has the configs module;
    -- highlighting is enabled by default when parsers are available.
    -- Ensure highlight is on and regex highlighting is off:
    vim.treesitter.start = vim.treesitter.start -- ensure autostart
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
