-- https://github.com/ellisonleao/gruvbox.nvim

return {
  "ellisonleao/gruvbox.nvim",

  priority = 1000, -- load early so `colorscheme` works

  config = function(_, opts)
    -- pass your opts into setup, *then* apply the theme:
    require("gruvbox").setup(opts)
    vim.o.background = "dark" -- or "light"
    vim.cmd("colorscheme gruvbox")
  end,

  opts = {
    -- terminal & UI settings
    terminal_colors      = true,
    undercurl            = true,
    underline            = true,
    bold                 = true,
    italic               = {
      strings   = true,
      comments  = true,
      operators = false,
      folds     = true,
    },
    strikethrough        = true,
    invert_selection     = false,
    invert_signs         = false,
    invert_tabline       = false,
    invert_intend_guides = false,
    inverse              = true,   -- invert search/diff/status/error bg
    contrast             = "soft", -- one of "", "soft", "hard"
    palette_overrides    = {},     -- override any of gruvbox’s palette colors
    overrides            = {},     -- override specific highlight groups
    dim_inactive         = false,
    transparent_mode     = false,
  },
}
