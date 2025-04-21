-- https://github.com/loctvl842/monokai-pro.nvim

return {
  'loctvl842/monokai-pro.nvim',
  priority = 1000, -- load early to set the colorscheme immediately

  config = function()
    require('monokai-pro').setup({
      -- statically choose the "pro" filter; no interactive selection needed
      filter = 'spectrum',

      transparent_background = false,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment       = { italic = true },
        keyword       = { italic = true },
        type          = { italic = true },
        storageclass  = { italic = true },
        structure     = { italic = true },
        parameter     = { italic = true },
        annotation    = { italic = true },
        tag_attribute = { italic = true },
      },
      -- disable automatic day/night switching
      day_night = { enable = false },
      -- clear backgrounds in floating windows
      background_clear = { 'telescope', 'notify' },
    })

    -- apply the colorscheme
    vim.cmd "colorscheme monokai-pro"
  end,
}
