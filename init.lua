-- Plugins settings
require "setup.plugins"

-- General settings, mostly from vim-sensible
vim.cmd([[
source ~/.config/nvim/general.vim
]])

-- file explorer mapping, lualine, colorschemes.
vim.cmd([[
source ~/.config/nvim/uiconfig.vim
]])

-- File explorer
require "setup.file_explorer"

-- lualine
require "setup.lualine"

-- tree-sitter
require "setup.tree_sitter"

-- telescope
-- require "setup.telescope"

-- Autocomplete
require "setup.autocomplete"

-- Language specific settings.
require "setup.languages"


-- Latex config, stolen from
-- `https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536`
-- vim.cmd([[
-- source ~/.config/nvim/latex.vim
-- ]])

--[[
nnn
autocomplete per language (sources)
solidity
lua (version fix)
js/ts
telescope and fzf
lualine
delete old files
latex
--]]
