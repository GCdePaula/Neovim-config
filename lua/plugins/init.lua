--------------------
-- lazy.nvim
----------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--[[
TODO

* configure snack
better notification
dashboard
figure out all other settings

* AI assistant

]]

require("lazy").setup {
  spec = {
    --- General
    require "plugins.setup.snacks",

    --- Colorschemes
    -- require "plugins.setup.colors.groovbox",
    require "plugins.setup.colors.melange",
    -- require "plugins.setup.colors.rose",
    -- require "plugins.setup.colors.catppuccin",
    -- require "plugins.setup.colors.monokai",

    -- Tree sitter
    require "plugins.setup.tree_sitter",

    -- File navigation
    require "plugins.setup.file_navigation.yazi",
    require "plugins.setup.file_navigation.telescope",

    --- Autocomplete
    require "plugins.setup.autocomplete",

    --- LSP
    require "plugins.setup.lsp.init",
    require "plugins.setup.lsp.rust",

    --- Comments
    require "plugins.setup.comments",


    -- statusline
    require "plugins.setup.lualine",
    -- 'nvim-lualine/lualine.nvim',
  }
}
