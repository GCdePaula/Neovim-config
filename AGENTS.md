# Agents

## Adding a new plugin

1. Create a file under `lua/config/` (or a subdirectory like `colors/`, `file_navigation/`, `lsp/`) that returns a lazy.nvim plugin spec table.
2. Add `require "config.<path>"` to the `spec` table in `lua/plugins.lua`.
3. LSP keybindings are handled globally via the `LspAttach` autocmd in `lua/config/lsp/on_attach.lua` — no per-plugin wiring needed.

## Adding a new LSP server

1. Add the server's nix package to `home.packages` in `~/.config/nix-darwin/home/packages.nix` and rebuild (`darwin-rebuild`).
2. Add the server name to the `vim.lsp.enable()` list in `lua/config/lsp/init.lua`.
3. If it needs custom settings, create a `lsp/<server>.lua` file at the nvim root returning a config table. Simple servers need no file — nvim-lspconfig provides defaults.

## Adding a new treesitter parser

1. Add the parser to the `nvim-treesitter.withPlugins` list in `~/.config/nix-darwin/home.nix` and rebuild.
2. No changes needed in the nvim config — nix provides the parser, treesitter picks it up automatically.

## Modifying keybindings

- General keymaps: `init.lua` (search for "Key mappings" section)
- LSP keymaps: `lua/config/lsp/on_attach.lua`
- Plugin-specific keymaps: in the plugin's own config file (e.g., `telescope.lua`, `yazi.lua`)
- Indent shortcuts: `lua/funcs.lua`

## Modifying options/settings

- All vim options are in `init.lua` under "General settings".
- Plugin-specific options go in the plugin's config file.
- Do not create VimScript files; keep everything in Lua.

## Testing changes

Run `nvim --startuptime /tmp/startup.log` to check for errors or slow startup. Check `:checkhealth` for plugin/LSP issues.
