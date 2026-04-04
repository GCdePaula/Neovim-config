-- enable 24-bit RGB in the terminal
vim.o.termguicolors = true

--------------------
-- General settings (ported from general.vim, vim-sensible defaults removed)
--------------------

-- Mouse
vim.opt.mouse = 'a'

-- System clipboard
vim.opt.clipboard = 'unnamedplus'

-- Persistent undo
vim.opt.undofile = true

-- Support all kind of EOLs
vim.opt.fileformats:append('mac')

-- Tabs: 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '↳ '
vim.opt.display:append('lastline')

-- Show hidden characters
vim.opt.listchars = { tab = '→|', trail = '•', extends = '⟩', precedes = '⟨', nbsp = '␣' }
vim.opt.list = true

-- Delete comment character when joining commented lines
vim.opt.formatoptions:append('j')

-- Increment ignores octal format
vim.opt.nrformats:remove('octal')

-- Remove included files from autocomplete
vim.opt.complete:remove('i')

-- UI
vim.opt.title = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.completeopt = 'menu,menuone,noselect'

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

--------------------
-- Key mappings
--------------------
vim.g.mapleader = ','

-- Preserve clipboard when pasting over selection
vim.keymap.set('x', '<leader>p', 'p:let @+=@0<CR>', { silent = true })

-- Delete line to void register
vim.keymap.set('n', '<leader>dd', '"_dd')

-- Clear search highlight
vim.keymap.set('n', '<leader>c', '<cmd>nohlsearch<CR>')

-- Makes Ctrl-U in insert mode more forgiving
vim.keymap.set('i', '<C-U>', '<C-G>u<C-U>')

-- Toggle list mode
vim.keymap.set('n', '<leader>l', '<cmd>set list!<CR>')

-- Navigate splits
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

--------------------
-- LSP keybindings (LspAttach autocmd)
--------------------
require 'config.lsp.on_attach'

--------------------
-- Plugins
--------------------
require 'plugins'

--------------------
-- Utility user functions
--------------------
require 'funcs'

--------------------
-- Spell check for text-focused filetypes
--------------------
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'latex', 'tex', 'md', 'markdown', 'typst' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

--------------------
-- Set filetype for just
--------------------
vim.filetype.add {
  pattern = {
    ['[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]'] = 'just',
    ['.*%.[Jj][Uu][Ss][Tt]'] = 'just',
  },
}

--------------------
-- Diagnostics
--------------------
vim.diagnostic.config { virtual_text = true, signs = true, underline = true }

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics to location list' })
