local lsp = require 'lspconfig'

lsp.texlab.setup {
  settings = {
    texlab = {

      build = {
        onSave = true,
        executable = "tectonic",
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates",
          "--outdir",
          "build",
        },
      },

      auxDirectory = "build",

      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = {"%l", "%p", "%f"},
      },

      chktex = {
        onOpenAndSave = true,
      },

    }
  }
}

-- Set spell check for specific files
vim.cmd([[
autocmd FileType latex,tex,md,markdown setlocal spell
]])
