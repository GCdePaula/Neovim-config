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

require("lazy").setup {
  spec = {
    --- General
    require "config.snacks",

    --- Colorschemes
    -- require "config.colors.groovbox",
    require "config.colors.melange",
    -- require "config.colors.rose",
    -- require "config.colors.catppuccin",
    -- require "config.colors.monokai",

    -- Tree sitter
    require "config.tree_sitter",

    -- File navigation
    require "config.file_navigation.yazi",
    require "config.file_navigation.telescope",

    --- Autocomplete
    require "config.autocomplete",

    --- LSP
    require "config.lsp.init",
    require "config.lsp.rust",

    --- Comments
    require "config.comments",

    -- statusline
    require "config.lualine",
  }
}
