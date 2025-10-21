return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- This table will hold our configuration
  opts = {
    -- We will configure this in Step 2
    log_level = "DEBUG",

    adapter = {
      id = "openai",
      options = {
        model = "gpt-5", -- or "gpt-4-turbo"
      },
    }
  },


  keys = {
    -- The main "Cursor-like" inline edit command
    -- Works in both NORMAL and VISUAL mode
    {
      "<leader>ci",
      function()
        require("codecompanion.actions").inline_edit()
      end,
      mode = { "n", "v" },
      desc = "CodeCompanion - Inline Edit",
    },

    -- Open the chat window
    {
      "<leader>cc",
      function()
        require("codecompanion.actions").chat()
      end,
      mode = "n",
      desc = "CodeCompanion - Chat",
    },

    -- A quick "explain this" command (works on visual selection)
    {
      "<leader>ce",
      function()
        require("codecompanion.actions").explain()
      end,
      mode = "v",
      desc = "CodeCompanion - Explain",
    },

    -- Generate unit tests (works on visual selection)
    {
      "<leader>ct",
      function()
        require("codecompanion.actions").generate_tests()
      end,
      mode = "v",
      desc = "CodeCompanion - Generate Tests",
    },
  },
}
