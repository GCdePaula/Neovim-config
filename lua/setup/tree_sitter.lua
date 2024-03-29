-- tree-sitter config
local configs = require "nvim-treesitter.configs"

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "go",
    "gomod",
    "gosum",
    "gowork",
    "lua",
    "ocaml",
    "ocaml_interface",
    "rust",
    "solidity_correct",
  },

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
