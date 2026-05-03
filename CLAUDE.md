# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), adapted for Neovim 0.12. The key departures from upstream kickstart: **native `vim.pack` replaces lazy.nvim** for plugin management, and the single-file layout was split into a modular structure.

## Architecture

`init.lua` is the sole entry point — it calls `require("config")` then `require("plugins")`.

**`lua/config/`** — editor settings, loaded unconditionally before plugins:
- `global.lua` — leader key and `vim.g` globals (must load first)
- `options.lua` — `vim.o` settings
- `mappings.lua` — global keymaps and diagnostic config
- `autocommands.lua` — global autocommands

**`lua/plugins/`** — plugin declarations and setup:
- `init.lua` — single call to `vim.pack.add({...})` listing every plugin URL, then `require`s each plugin module
- Each plugin module (`git.lua`, `lsp.lua`, `ui.lua`, etc.) calls `setup()` and registers keymaps for its plugins
- `lsp/` subdirectory — one file per language returning a server config table (`go.lua`, `lua.lua`, `python.lua`)

## Plugin Management

Plugins are managed via `vim.pack` (Neovim 0.12 built-in — no lazy.nvim or other external manager). To add a plugin:

1. Add `{ src = "https://github.com/author/plugin.nvim" }` to the `vim.pack.add({})` call in `lua/plugins/init.lua`
2. Either configure it inline in an existing module or create `lua/plugins/yourplugin.lua` and `require` it at the bottom of `lua/plugins/init.lua`

## Adding LSP Servers

LSP servers are configured in `lua/plugins/lsp.lua`, which merges tables from `lua/plugins/lsp/*.lua`. To add a new language server:

1. Create `lua/plugins/lsp/yourlang.lua` returning a table: `return { server_name = { ...config } }`
2. Merge it into the `servers` table in `lsp.lua` by adding `require("plugins.lsp.yourlang")` to the `vim.tbl_extend` call
3. Mason auto-installs everything in `ensure_installed` (derived from `vim.tbl_keys(servers)`)

Currently configured: `gopls` (Go), `lua_ls` (Lua), `basedpyright` (Python), `stylua` (formatter, no LSP).

## Checking for Issues

There is no build step. To validate the config:

```sh
nvim --headless -c "lua print('ok')" -c "qa"
nvim --headless -u lua/plugins/lsp.lua -c "qa"   # quick syntax check on a module
```

To check Lua syntax on a file without opening Neovim:
```sh
luacheck lua/plugins/ui.lua   # requires luacheck installed
```

## Key Conventions

- `<Space>` is the leader key, set in `lua/config/global.lua` before any plugin loads
- Keymaps are registered in the same module as the plugin they belong to, not centralized
- LSP buffer-local keymaps go in `LspAttach` autocommand callbacks (see `lsp.lua` and `navigation.lua`)
- `navigation.lua` overrides several default LSP `gr*` keys to use Telescope pickers instead of the built-in handlers
- `vim.g.have_nerd_font = true` — toggle this if working in a terminal without Nerd Font support
