-- Catppuccin (Frappe)
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    integrations = { treesitter = true, cmp = true, gitsigns = true },
  },
}
