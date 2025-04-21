-- helper to set both tabstop and shiftwidth
local function set_indent(width)
  vim.opt.tabstop    = width
  vim.opt.shiftwidth = width
end

-- mappings for <leader>8 / 4 / 2
vim.keymap.set('n', '<leader>8', function() set_indent(8) end, { desc = 'Set indent to 8 spaces' })
vim.keymap.set('n', '<leader>4', function() set_indent(4) end, { desc = 'Set indent to 4 spaces' })
vim.keymap.set('n', '<leader>2', function() set_indent(2) end, { desc = 'Set indent to 2 spaces' })

-- use tabs instead of spaces
local function use_tabs()
  vim.opt.expandtab   = false -- no expandtab
  vim.opt.autoindent  = true  -- copy indent from current line
  vim.opt.softtabstop = 0     -- disable softtabstop
end

-- use spaces instead of tabs
local function use_spaces()
  vim.opt.expandtab   = true -- expand tabs to spaces
  vim.opt.autoindent  = true -- copy indent from current line
  vim.opt.softtabstop = 1    -- tab key inserts 1 space
end

-- expose them as commands so you can do :UseTabs or :UseSpaces
vim.api.nvim_create_user_command('UseTabs', use_tabs, {})
vim.api.nvim_create_user_command('UseSpaces', use_spaces, {})
