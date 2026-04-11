vim.pack.add({
	{ src = "https://github.com/NMAC427/guess-indent.nvim" },

	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },

	{ src = "https://github.com/stevearc/conform.nvim" },

	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

require("plugins.git")
require("plugins.ui")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.formatting")
require("plugins.completion")
require("plugins.treesitter")
require("plugins.neotree")
