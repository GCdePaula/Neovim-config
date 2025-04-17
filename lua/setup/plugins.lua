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
    --- Colorschemes
    'ellisonleao/gruvbox.nvim',
    -- use 'gruvbox-community/gruvbox'
    'ayu-theme/ayu-vim',
    'junegunn/seoul256.vim',

    -- Tree sitter
    require "setup.tree_sitter",

    -- File explorer
    require "setup.file_explorer.yazi",
    require "setup.file_explorer.telescope",


    -- { "nvim-tree/nvim-web-devicons", lazy = true },
    'nvim-lua/plenary.nvim',
    -- 'mfussenegger/nvim-dap',

    -- {
    --   'nvim-tree/nvim-tree.lua',
    --   dependencies = {
    --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --   },
    -- },

    'nvim-lualine/lualine.nvim',


    -- --- Telescope
    -- use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- use 'nvim-telescope/telescope-ui-select.nvim'





    --- Comments
    'tpope/vim-commentary',


    --- fzf
    -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }



    --- LSP
    'neovim/nvim-lspconfig',


    --- Autocomplete
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'uga-rosa/cmp-dictionary',
    -- 'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    --- Language specific plugins
    -- Rust
    {
      'mrcjkb/rustaceanvim',
      lazy = false, -- This plugin is already lazy
    },

    -- just
    {
      "NoahTheDuke/vim-just",
      ft = { "just" },
    },

    -- TOML
    'cespare/vim-toml',
  }
}

--[=[
return require('packer').startup(function(use)
  --- Packerception
  use 'wbthomason/packer.nvim'


  --- Colorschemes
  use 'ellisonleao/gruvbox.nvim'
  -- use 'gruvbox-community/gruvbox'
  use 'ayu-theme/ayu-vim'
  use 'junegunn/seoul256.vim'


  --- UI
  -- use { 'scrooloose/nerdtree', cmd = 'NERDTreeToggle' }

  -- use {
  --   "luukvbaal/nnn.nvim",
  --   config = function() require("nnn").setup() end
  -- }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use 'nvim-lualine/lualine.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  --- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'nvim-telescope/telescope-ui-select.nvim'

  --- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  --- Comments
  use 'tpope/vim-commentary'


  --- fzf
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  --- LSP
  use 'neovim/nvim-lspconfig'


  --- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'uga-rosa/cmp-dictionary'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'


  --- Language specific plugins
  -- Rust
  use 'simrat39/rust-tools.nvim'
  -- use 'rust-lang/rust.vim'

  -- Lua
  -- use 'tbastos/vim-lua'

  -- Solidity
  -- use { 'TovarishFin/vim-solidity', ft = 'solidity' }

  -- TOML
  use 'cespare/vim-toml'

  -- Latex
  -- use 'lervag/vimtex'

  -- Cairo
  use { 'starkware-libs/cairo-lang', rtp = 'cairo-lang/src/starkware/cairo/lang/ide/vim/' }

  -- TODO: JS, TS, OCaml, TeX
  -- TODO: Snippets
end)
--]=]

--[=[

-- typescript
Plug 'leafgarland/typescript-vim'
-- Plug 'peitalin/vim-jsx-typescript'

-- OCaml
Plug 'ocaml/vim-ocaml'


-- Golang
-- Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

-- TeX
Plug 'lervag/vimtex'



call plug#end()
--------------------

--]=]
