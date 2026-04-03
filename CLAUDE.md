# Neovim Configuration

Personal Neovim config, pure Lua. Plugin manager: lazy.nvim.

## Structure

```
init.lua                        Entry point: options, keymaps, autocmds, diagnostics
lua/plugins.lua                 lazy.nvim bootstrap + plugin spec list
lua/funcs.lua                   Indent helpers (:UseTabs, :UseSpaces, <leader>2/4/8)
lua/config/
  snacks.lua                    Dashboard, bigfile, statuscolumn, indent guides, word highlight
  tree_sitter.lua               Syntax highlighting, parser auto-install
  autocomplete.lua              nvim-cmp: LSP + path sources; dictionary + buffer for prose
  comments.lua                  Comment.nvim (gc/gcc)
  lualine.lua                   Statusline with git/diagnostics
  lsp/
    init.lua                    Mason + lspconfig setup, server handlers
    on_attach.lua               LSP keybindings (gd, gr, K, <leader>rn, etc.)
    rust.lua                    rustaceanvim with format-on-save
  colors/                       Colorscheme configs (melange active, others available)
  file_navigation/
    telescope.lua               Fuzzy finder (<space>f files, <space>g grep)
    yazi.lua                    File manager (<leader>_ open, <leader>- resume)
```

## Conventions

- All config is Lua. No VimScript files.
- Each plugin gets its own file under `lua/config/` returning a lazy.nvim plugin spec table.
- Leader key is `,`.
- LSP keybindings are set in `on_attach.lua` and shared across all language servers.
- Per-server LSP config goes in the mason-lspconfig handlers block in `lsp/init.lua`, or in a dedicated file (like `rust.lua`) for complex setups.
- Colorschemes live in `lua/config/colors/`; swap by uncommenting in `plugins.lua`.
- Lua runtime is set to 5.4 (not LuaJIT) in lua_ls config -- this is intentional.

## Key Patterns

- Plugin specs are `require`d inline in `plugins.lua`'s `spec` table.
- Format-on-save is per-language via `BufWritePre` autocmds (currently only Rust).
- Spell check auto-enables for latex, tex, md, markdown, typst filetypes.
- `softtabstop = 0` defers to `shiftwidth`; default indent is 2 spaces.
