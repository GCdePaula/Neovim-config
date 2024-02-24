vim.opt.signcolumn = "yes"

local vim_api = vim.api

-- Remappings
do
  local opts = { noremap = true, silent = true }
  vim_api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim_api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim_api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim_api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- languages
require 'setup.languages.golang'
require 'setup.languages.lua'
require 'setup.languages.ocaml'
require 'setup.languages.rust'
require 'setup.languages.solidity'
require 'setup.languages.tex'
