# Agents

## Adding a new plugin

1. Create a file under `lua/config/` (or a subdirectory like `colors/`, `file_navigation/`, `lsp/`) that returns a lazy.nvim plugin spec table.
2. Add `require "config.<path>"` to the `spec` table in `lua/plugins.lua`.
3. If the plugin needs LSP on_attach, use the shared `require "config.lsp.on_attach"` function.

## Adding a new LSP server

1. Add the server name to the `ensure_installed` list in `lua/config/lsp/init.lua`.
2. If it needs custom settings, add an `elseif server == '<name>'` branch in the default handler.
3. If it needs complex setup (like Rust), create a dedicated file under `lua/config/lsp/`.

## Modifying keybindings

- General keymaps: `init.lua` (search for "Key mappings" section)
- LSP keymaps: `lua/config/lsp/on_attach.lua`
- Plugin-specific keymaps: in the plugin's own config file (e.g., `telescope.lua`, `yazi.lua`, `ai.lua`)
- Indent shortcuts: `lua/funcs.lua`

## Modifying options/settings

- All vim options are in `init.lua` under "General settings".
- Plugin-specific options go in the plugin's config file.
- Do not create VimScript files; keep everything in Lua.

## Testing changes

Run `nvim --startuptime /tmp/startup.log` to check for errors or slow startup. Check `:checkhealth` for plugin/LSP issues.
