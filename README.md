# NeoVim Configuration

This is my personal configuration of NeoVim. It is largely based off of [Kikcstart](https://github.com/nvim-lua/kickstart.nvim), but has been adapted to the 0.12 release of NeoVim. This means that it now uses the new `vim.pack` for plugin management, instead of [Lazy](https://github.com/folke/lazy.nvim).
It was also refactored to be more modular. A single `init.lua` file lives at the top of the config, importing everything, from mappings to plugin configuration, from submodules at `lua/`.
