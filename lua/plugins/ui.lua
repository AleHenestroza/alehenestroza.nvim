require("alpha").setup(require("alpha.themes.dashboard").config)

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
})

require("snacks").setup({
	terminal = {
		auto_close = false,
		win = {
			position = "float",
			border = "rounded",
			height = 0.4,
			width = 0.4,
		},
	},
})

-- Floating terminal
vim.keymap.set("n", "<leader>tt", function()
	Snacks.terminal.toggle()
end, { desc = "[T]oggle [T]erminal" })

require("which-key").setup({
	delay = 0,
	icons = {
		mappings = vim.g.have_nerd_font,
	},
	spec = {
		{ "<leader>a", group = "[A]I", icon = "󰚩", mode = { "n", "v" } },
		{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		{ "<leader>g", group = "[G]it" },
		{ "<leader>x", group = "Diagnostics" },
		{ "<leader>T", group = "[T]esting" },
		{ "<leader>v", group = "[V]env" },
		{ "gr", group = "LSP Actions", mode = { "n" } },
		{ "<leader>cl", icon = "󰦕", mode = { "n" } },
	},
})

require("tokyonight").setup({
	styles = {
		comments = { italic = false },
	},
})

--vim.cmd.colorscheme("tokyonight-night")

require("catppuccin").setup({
	colorscheme = "macchiato",
	auto_integrations = true,
	integrations = {
		blink_cmp = {
			style = "bordered",
		},
		gitsigns = true,
		mason = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		neotree = true,
		dap = true,
		snacks = {
			enabled = true,
			indentscope_color = "",
		},
		telescope = {
			enabled = true,
		},
		which_key = true,
		trouble = true,
		neotest = true,
	},
})

vim.cmd.colorscheme("catppuccin-macchiato")

require("todo-comments").setup({
	signs = false,
})

require("mini.ai").setup({
	n_lines = 500,
})

require("mini.surround").setup()

-- Auto-close brackets/quotes; <CR> between a pair puts the closer on its own line
require("mini.pairs").setup()

require("mini.statusline").setup()

local statusline = require("mini.statusline")
statusline.setup({
	use_icons = vim.g.have_nerd_font,
})

statusline.section_location = function()
	return "%2l:%-2v"
end

require("neo-tree").setup({
	filesystem = {
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		vim.wo.statuscolumn = ""
	end,
})

vim.keymap.set("n", "\\", "<cmd>Neotree reveal<CR>", {
	desc = "NeoTree reveal",
	silent = true,
})

require("trouble").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Loclist" })

require("render-markdown").setup({})
