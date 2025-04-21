return {
  "mikavilpas/yazi.nvim",

  event        = "VeryLazy",

  dependencies = {
    "folke/snacks.nvim"
  },

  keys         = {
    { "<leader>_",  "<cmd>Yazi<cr>",        desc = "Yazi: Open file manager" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>",    desc = "Yazi: CWD file manager" },
    { "<leader>-",  "<cmd>Yazi toggle<cr>", desc = "Yazi: Resume last session" },
  },

  opts         = {
    open_for_directories = false,
    keymaps = {
      open_file_in_tab = "<leader>t",
      show_help = "<F1>"
    },
  },
  init         = function()
    vim.g.loaded_netrwPlugin = 1 -- disable netrw if needed
  end,
}
