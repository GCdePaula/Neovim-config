local lsp = require 'lspconfig'

lsp.texlab.setup {
  settings = {
    texlab = {

      build = {
        onSave = true,
        forwardSearchAfter = true,
        -- executable = "latexmk",
        -- args = {
        --   "-pdf",
        --   '-pdflatex="pdflatex -interaction=nonstopmode"',
        --   "%f",
        -- },

        executable = "tectonic",
        args = {
          "-X",
          "compile",
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
        args = { "-r", "-g", "%l", "%p", "%f" },
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
