vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= 'rust-analyzer' then return end

    local bufnr = args.buf
    local group = vim.api.nvim_create_augroup("LspRustFmt", { clear = false })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group    = group,
      buffer   = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end,
})

return {
  'mrcjkb/rustaceanvim',

  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require('cmp_nvim_lsp')
            .default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      },
    }
  end,
}
