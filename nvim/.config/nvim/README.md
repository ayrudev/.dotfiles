# Neovim configuration notes

## Centralized LSP module

`lua/config/lsp.lua` now owns shared LSP behavior:

- Diagnostic UI defaults (signs enabled, limited virtual text, rounded floating diagnostics)
- Common `on_attach(client, bufnr)` keymaps (`gd`, `K`, `gr`, `gi`, `<leader>rn`, `<leader>ca`, `<leader>f`, `[d`, `]d`, `<leader>d`)
- LSP capabilities from `cmp_nvim_lsp.default_capabilities()` when available
- Graceful Mason + mason-lspconfig setup (if installed)
- Default server setup table and looped registration through `lspconfig`

## Default configured servers

Current defaults in `lua/config/lsp.lua`:

- `tsserver` (falls back to `ts_ls` when only that server exists in local lspconfig)
- `gopls`
- `pyright`
- `lua_ls` (with Neovim runtime/workspace config and telemetry disabled)

## Adding or customizing servers

Edit the `default_servers()` table in `lua/config/lsp.lua`:

- Add a new entry for any server you want to configure.
- Add server-specific `settings` under that server key.
- Keep common behavior (`on_attach` and `capabilities`) centralized so all servers share the same defaults.
