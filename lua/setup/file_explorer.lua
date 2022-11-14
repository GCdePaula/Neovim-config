local nvim_tree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  view = {
    side = "right",
    signcolumn = "no",

    mappings = {
      list = {
        -- { key = { "<CR>", "o", "<LeftRelease>" }, action = "edit" },
      },
    },
  },
})
