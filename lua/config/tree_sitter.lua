-- lua/plugins/tree_sitter.lua
return {
  'nvim-treesitter/nvim-treesitter',

  -- on install/update, run the equivalent of :TSUpdate
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })()
  end,

  -- lazy‑load when opening a file
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "rust",
        "solidity",
        "vim",

        "go",
        "gomod",
        "gosum",
        "gowork",

        "ocaml",
        "ocaml_interface",

        "javascript",
        "typescript",

        "dockerfile",
        "html",
        "just",
        "make",
        "nix",
        "sql",

        "json",
        "toml",
        "yaml",
      },

      auto_install = true,

      highlight = {
        enable = true,

        -- only use tree-sitter’s highlighter
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
