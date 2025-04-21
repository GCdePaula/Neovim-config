-- https://github.com/rose-pine/neovim
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd "colorscheme rose-pine"
  end,
  opts = {
    dark_variant = "moon", -- main contrast: 'moon' or 'dawn'
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
  },
}
