local nnn = require("nnn")
local builtin = nnn.builtin

nnn.setup({
  explorer = {
    cmd = "nnn",       -- command overrride (-F1 flag is implied, -a flag is invalid!)
    width = 32,        -- width of the vertical split
    side = "botright",
    session = "global",
    tabs = false,       -- seperate nnn instance per tab
  },

  auto_open = {
    setup = "explorer",
    tabpage = "explorer",
    ft_ignore = {      -- dont auto open for these filetypes
      "gitcommit",
    }
  },

  auto_close = true,
  replace_netrw = "explorer",
  mappings = {
    { "<C-t>", builtin.open_in_tab },
  },

  windownav = {        -- window movement mappings to navigate out of nnn
    left = "<C-w>h",
    right = "<C-w>l",
    next = "<C-w>w",
    prev = "<C-w>W",
  },
})
