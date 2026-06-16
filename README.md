# NeoVim Configuration

My personal NeoVim setup, built on top of
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and adapted for
NeoVim 0.12. The biggest departure from upstream kickstart is the switch from
[lazy.nvim](https://github.com/folke/lazy.nvim) to the new built-in `vim.pack`
for plugin management. I also refactored the original single-file structure into
a modular layout so it's easier to navigate and extend.

## Structure

```text
.
├── init.lua                  # Entry point — loads config and plugins
└── lua/
    ├── config/
    │   ├── init.lua          # Loads all config modules
    │   ├── global.lua        # Leader key and global vim.g settings
    │   ├── options.lua       # vim.o editor options
    │   ├── mappings.lua      # Global keymaps and diagnostic config
    │   └── autocommands.lua  # Global autocommands (e.g. yank highlight)
    └── plugins/
        ├── init.lua          # vim.pack.add declarations + loads plugin modules
        ├── ai.lua            # Claude Code integration
        ├── completion.lua    # blink.cmp + LuaSnip
        ├── debug.lua         # DAP + DAP UI
        ├── formatting.lua    # conform.nvim + guess-indent
        ├── gamedev.lua       # Godot/GDScript support
        ├── git.lua           # gitsigns + lazygit + diffview
        ├── lint.lua          # nvim-lint
        ├── lsp.lua           # LSP config via mason + nvim-lspconfig + nvim-ufo
        ├── navigation.lua    # Telescope + miniharp keybindings
        ├── treesitter.lua    # Tree-sitter syntax/indentation
        ├── ui.lua            # Colorscheme, which-key, mini.nvim, alpha, noice, trouble
        ├── venv.lua          # Python virtualenv selector
        └── lsp/
            ├── c.lua         # clangd config
            ├── go.lua        # gopls config
            ├── java.lua      # jdtls config (externally managed by nvim-jdtls)
            ├── lua.lua       # lua_ls config
            └── python.lua    # basedpyright config
```

## Plugin Management

Plugins are declared in `lua/plugins/init.lua` using `vim.pack.add`, the native
plugin manager introduced in NeoVim 0.12. No external plugin manager is needed.
Each plugin module is then `require`d in that same file to run its setup.

## Plugins

### UI

- **[catppuccin](https://github.com/catppuccin/nvim)** — Colorscheme, using the
  Macchiato variant. Tokyo Night is also installed but currently inactive.
- **[noice.nvim](https://github.com/folke/noice.nvim)** — Replaces the built-in
  UI for messages, cmdline, and popupmenu. Overrides LSP doc/signature rendering
  and enables a command-palette preset. Requires `nui.nvim` and `nvim-notify`.
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** — Popup showing
  available keybindings as you type a prefix. Zero delay.
- **[mini.nvim](https://github.com/nvim-mini/mini.nvim)** — Using three modules:
  - `mini.ai` — Extended text objects (`a` and `i` motions)
  - `mini.surround` — Add/change/delete surrounding pairs
  - `mini.statusline` — Minimal statusline
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** — Startup dashboard
  shown when Neovim opens with no file arguments.
- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)**
  — Renders Markdown syntax (headers, code blocks, etc.) directly in the buffer.
- **[trouble.nvim](https://github.com/folke/trouble.nvim)** — Pretty diagnostics
  panel. `<leader>xx` to toggle project-wide diagnostics, `<leader>xb` for the
  current buffer.
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** —
  Highlights `TODO`, `FIXME`, `NOTE`, etc. in comments. Signs disabled.
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** —
  File type icons (requires a Nerd Font).

### Navigation

- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** — Fuzzy
  finder for files, grep, LSP symbols, keymaps, help, and more. FZF native
  sorter and UI-select extension included.
- **[miniharp.nvim](https://github.com/vieitesss/miniharp.nvim)** — File mark
  navigation. Toggle a mark on the current file, then cycle through marked files
  or open the mark list.
- **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)** — File
  explorer sidebar. Open/reveal with `\`.

### LSP

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** — LSP client
  configurations.
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** — Manages LSP
  server, formatter, and linter installations.
- **[mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)**
  — Bridges mason and lspconfig.
- **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)**
  — Auto-installs tools listed in the servers table (currently `gopls`,
  `lua_ls`, `basedpyright`, `clangd`, and `stylua`).
- **[nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)** — Java LSP via
  Eclipse JDT Language Server. Configured in `lua/plugins/lsp/java.lua` like
  other servers, but marked as externally managed so nvim-jdtls handles
  attaching rather than `vim.lsp.enable`.
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** — LSP progress
  notifications in the corner.

### Folding

- **[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)** — Modern fold
  provider that uses LSP/Tree-sitter ranges. Shows a virtual-text suffix with
  the fold line count. Auto-closes import and comment folds on open.
- **[promise-async](https://github.com/kevinhwang91/promise-async)** —
  Async library required by nvim-ufo.

### Completion

- **[blink.cmp](https://github.com/saghen/blink.cmp)** — Completion engine.
  Sources: LSP, path, snippets. Signature help enabled. Documentation popup is
  manual (not auto-shown).
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** — Snippet engine backing
  blink.cmp.

### Formatting and Linting

- **[conform.nvim](https://github.com/stevearc/conform.nvim)** — Formats on
  save (except C/C++). Falls back to LSP formatting when no dedicated formatter
  is configured. `<leader>f` to format manually.
- **[guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)** —
  Detects indentation style from file content automatically.
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** — Runs linters on
  `BufEnter`, `BufWritePost`, and `InsertLeave`. Currently configured for
  Markdown (`markdownlint`) and Go (`golangcilint`).

### Syntax

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** —
  Tree-sitter integration for syntax highlighting and smarter indentation.
  Parsers auto-install on first open of an unrecognized filetype. Pre-installed:
  bash, c, diff, go, html, lua, luadoc, markdown, query, vim, vimdoc.

### Debugging

- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** — Debug Adapter
  Protocol client.
- **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** — UI that
  auto-opens on debug session start and closes on exit.
- **[mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)**
  — Auto-installs DAP adapters via mason. Currently installs `delve` (Go).
- **[nvim-dap-go](https://github.com/leoluz/nvim-dap-go)** — Go-specific DAP
  configuration.

### Git

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** — Git change
  indicators in the sign column, hunk staging/resetting, inline blame, and diff
  views.
- **[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** — Opens a
  lazygit terminal UI inside Neovim. Requires `lazygit` on `$PATH`.
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)** — Side-by-side
  diff view and per-file git history. `<leader>gd` to open, `<leader>gf` for
  current file history, `<leader>gc` to close.

### Python

- **[venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)**
  — Virtualenv picker integrated with Telescope. `<leader>vs` to select an
  environment, `<leader>vc` to re-activate the last cached one.

### Game Development

- **[godotdev.nvim](https://github.com/Mathijs-Bakker/godotdev.nvim)** — Godot
  engine integration: GDScript formatter and inline type hints. Tree-sitter
  auto-setup is disabled (handled by nvim-treesitter).

### AI

- **[claudecode.nvim](https://github.com/coder/claudecode.nvim)** — Claude Code
  integration. Opens Claude in a terminal split, with keymaps to add
  buffers/selections as context and accept or deny diffs from within Neovim.
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** — Required by
  claudecode.nvim. Also provides a floating terminal toggled with `<leader>tt`.

## Key Mappings

`<Space>` is the leader key.

### General

| Key | Action |
| --- | ------ |
| `<Esc>` | Clear search highlight |
| `<C-h/j/k/l>` | Navigate between splits |
| `<Esc><Esc>` (terminal) | Exit terminal mode |
| `<leader>q` | Open diagnostic quickfix list |
| `<leader>f` | Format buffer |

### File Marks (miniharp)

| Key | Action |
| --- | ------ |
| `<leader>mm` | Toggle mark on current file |
| `<C-n>` | Next marked file |
| `<C-p>` | Previous marked file |
| `<leader>ml` | Open mark list |

### Search (Telescope)

| Key | Action |
| --- | ------ |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep current word |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sd` | Search diagnostics |
| `<leader>sc` | Search commands |
| `<leader>ss` | Select Telescope picker |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>sn` | Search Neovim config files |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Live grep in open files |

### LSP

| Key | Action |
| --- | ------ |
| `grr` | Go to references |
| `grd` | Go to definition |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grn` | Rename symbol |
| `gra` | Code action |
| `grD` | Go to declaration |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |

### Debugging

| Key | Action |
| --- | ------ |
| `<F5>` | Start/Continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

### Git (gitsigns)

| Key | Action |
| --- | ------ |
| `]c` / `[c` | Next/previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hi` | Preview hunk inline |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle line blame |
| `<leader>tw` | Toggle word diff |
| `<leader>hq` | Send hunks to quickfix list |
| `<leader>hQ` | Send all hunks to quickfix list |
| `<leader>lg` | Open LazyGit |
| `<leader>gd` | Open diffview |
| `<leader>gf` | Current file git history |
| `<leader>gc` | Close diffview |

### Diagnostics (trouble)

| Key | Action |
| --- | ------ |
| `<leader>xx` | Project diagnostics panel |
| `<leader>xb` | Buffer diagnostics panel |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |

### Python

| Key | Action |
| --- | ------ |
| `<leader>vs` | Select virtualenv |
| `<leader>vc` | Activate cached virtualenv |

### Claude Code (AI)

| Key | Action |
| --- | ------ |
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume session |
| `<leader>aC` | Continue session |
| `<leader>am` | Select model |
| `<leader>ab` | Add current buffer |
| `<leader>as` (visual) | Send selection to Claude |
| `<leader>as` (neo-tree) | Add file from tree |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

### Terminal

| Key | Action |
| --- | ------ |
| `<leader>tt` | Toggle floating terminal |

### File Explorer

| Key | Action |
| --- | ------ |
| `\` | Open/reveal Neo-tree |
| `\` (in Neo-tree) | Close Neo-tree |

## Requirements

- NeoVim 0.12+
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `make` (for LuaSnip's jsregexp on non-Windows)
- Go + `delve` for Go debugging (or let mason install it)
- `markdownlint` and `golangci-lint` for linting
- [`lazygit`](https://github.com/jesseduffield/lazygit) for the LazyGit integration

