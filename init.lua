-- enable 24‑bit RGB in the terminal
vim.o.termguicolors = true

-- Plugins settings
require "plugins.init"

-- General settings, mostly from vim-sensible
vim.cmd([[
source ~/.config/nvim/general.vim
]])

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
require "setup.languages"


vim.filetype.add {
  -- Neovim adds start/end anchors to the patterns
  pattern = {
    ['[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt]'] = 'just',
  },
}


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
