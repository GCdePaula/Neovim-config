-- enable 24‑bit RGB in the terminal
vim.o.termguicolors = true

-- Plugins settings
require "plugins"

-- General settings, mostly from vim-sensible
vim.cmd [[
source ~/.config/nvim/general.vim
]]

-- Utility user functions
require "funcs"

-- Enable spell check for text‑focused filetypes
vim.cmd [[
autocmd FileType latex,tex,md,markdown setlocal spell
]]

-- Set filetype for just
vim.filetype.add {
  -- Neovim adds start/end anchors to the patterns
  pattern = {
    ['[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt]'] = 'just',
  },
}

--[[
TODO

* configure snack
better notification
dashboard
figure out all other settings

* AI assistant

]]

-- vim.opt.signcolumn = "yes"

-- vim.cmd([[
-- autocmd FileType latex,tex,md,markdown setlocal spell
-- ]])



-- file explorer mapping, lualine, colorschemes.
-- vim.cmd([[
-- source ~/.config/nvim/uiconfig.vim
-- ]])

-- File explorer
-- require "setup.file_explorer"

-- lualine
-- require "setup.lualine"

-- telescope
-- require "setup.telescope"

-- Autocomplete
-- require "setup.autocomplete"

-- Language specific settings.
-- require "setup.languages"
