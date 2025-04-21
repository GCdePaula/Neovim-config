-- https://github.com/numToStr/Comment.nvim
return {
  'numToStr/Comment.nvim',

  --[[
  opts = {
    -- tell it to use commentstring from treesitter contexts
    pre_hook = function(ctx)
      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = ctx.ctype == require('Comment.utils').ctype.block and '__multiline' or '__default',
      })
    end,
  },
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  ]]
}
