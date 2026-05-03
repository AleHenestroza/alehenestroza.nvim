vim.pack.add({
	-- UI
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/goolord/alpha-nvim" },

	-- NAVIGATION
	{ src = "https://github.com/vieitesss/miniharp.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	-- GIT
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },

	-- LSP
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },

	-- FORMATTING
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/NMAC427/guess-indent.nvim" },

	-- COMPLETION
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	-- TREESITTER
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- NEOTREE
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },

	-- AI
	{ src = "https://github.com/coder/claudecode.nvim" },

	-- DEBUG
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },

	-- LINT
	{ src = "https://github.com/mfussenegger/nvim-lint" },
})

require("plugins.git")
require("plugins.ui")
require("plugins.navigation")
require("plugins.lsp")
require("plugins.debug")
require("plugins.formatting")
require("plugins.completion")
require("plugins.treesitter")
require("plugins.neotree")
require("plugins.lint")
require("plugins.ai")
require("plugins.java")
