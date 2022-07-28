local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

-- Telescope
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
telescope.load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers)
vim.keymap.set('n', '<leader>sf', function()
  telescope_builtin.find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', telescope_builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags)
vim.keymap.set('n', '<leader>st', telescope_builtin.tags)
vim.keymap.set('n', '<leader>sd', telescope_builtin.grep_string)
vim.keymap.set('n', '<leader>sp', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>so', function()
  telescope_builtin.tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles)
