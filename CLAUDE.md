# Neovim Configuration

Personal Neovim config, pure Lua. Plugin manager: lazy.nvim.

## External Dependencies

LSP servers, treesitter parsers, and tools like ripgrep/fd are **not** managed by Neovim. They are declared in `~/.config/nix-darwin/home.nix` and installed via nix-darwin/home-manager. This is intentional to avoid auto-downloading binaries at runtime (supply chain concern).

- **LSP servers:** Declared as `home.packages` in home.nix. Configured via `vim.lsp.config()` / `vim.lsp.enable()` (Neovim 0.11+ native API). nvim-lspconfig provides base configs (cmd, filetypes, root_markers).
- **Treesitter parsers:** Declared via `nvim-treesitter.withPlugins` in home.nix. `auto_install` is `false` in the nvim config.
- **Adding a new LSP or parser:** Add it in home.nix first, rebuild with `darwin-rebuild`, then configure it in nvim if needed.

## Structure

```
init.lua                        Entry point: options, keymaps, autocmds, diagnostics, LspAttach
lua/plugins.lua                 lazy.nvim bootstrap + plugin spec list
lua/funcs.lua                   Indent helpers (:UseTabs, :UseSpaces, <leader>2/4/8)
lua/config/
  snacks.lua                    Dashboard, bigfile, statuscolumn, indent guides, word highlight
  tree_sitter.lua               Syntax highlighting (parsers provided by nix)
  autocomplete.lua              nvim-cmp: LSP + path sources; dictionary + buffer for prose
  comments.lua                  Comment.nvim (gc/gcc)
  lualine.lua                   Statusline with git/diagnostics
  lsp/
    init.lua                    vim.lsp.config + vim.lsp.enable (servers provided by nix)
    on_attach.lua               LspAttach autocmd: keybindings (gd, gr, K, <leader>rn, etc.)
    rust.lua                    rustaceanvim + format-on-save via LspAttach
  colors/                       Colorscheme configs (melange active, others available)
  file_navigation/
    telescope.lua               Fuzzy finder (<space>f files, <space>g grep)
    yazi.lua                    File manager (<leader>_ open, <leader>- resume)
lsp/                            File-based server configs (Neovim native convention)
  clangd.lua                    UTF-16 offset encoding
  lua_ls.lua                    Lua diagnostics + telemetry settings
  texlab.lua                    LaTeX build + forward search (Skim)
```

## Conventions

- All config is Lua. No VimScript files.
- Each plugin gets its own file under `lua/config/` returning a lazy.nvim plugin spec table.
- Leader key is `,`.
- LSP keybindings are set via an `LspAttach` autocmd in `on_attach.lua`, loaded from `init.lua`.
- Per-server LSP config goes in `lsp/<server>.lua` files at the nvim root (Neovim's native convention). Simple servers need no file — nvim-lspconfig provides defaults. All servers are enabled in `lua/config/lsp/init.lua`.
- Colorschemes live in `lua/config/colors/`; swap by uncommenting in `plugins.lua`.
- Lua runtime is set to 5.4 (not LuaJIT) in lua_ls config -- this is intentional.

## Key Patterns

- Plugin specs are `require`d inline in `plugins.lua`'s `spec` table.
- Format-on-save is per-language via `BufWritePre` autocmds (currently only Rust).
- Spell check auto-enables for latex, tex, md, markdown, typst filetypes.
- `softtabstop = 0` defers to `shiftwidth`; default indent is 2 spaces.
