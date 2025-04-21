return {
  "folke/snacks.nvim",

  priority = 1000,
  lazy = false,

  -- config = function()
  --   vim.g.snacks_animate = false
  -- end,

  opts = {
    -- -- dashboard = { enabled = true },

    bigfile = { enabled = true },
    quickfile = { enabled = true },
    notifier = { enabled = true },

    statuscolumn = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },


    -- words = { enabled = true },

    -- -- input = { enabled = true },
    -- -- explorer = { enabled = true },
    -- -- picker = { enabled = true },
    -- -- scope = { enabled = true },
    -- -- scroll = { enabled = true },


  },
}
