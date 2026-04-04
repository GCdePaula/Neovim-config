return {
  settings = {
    texlab = {
      build = {
        executable = 'latexmk',
        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
        onSave = true,
      },
      forwardSearch = {
        executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
        args = { '-r', '%l', '%p', '%f' },
      },
      chktex = { onOpenAndSave = true },
    },
  },
}
