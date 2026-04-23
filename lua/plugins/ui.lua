require("alpha").setup(require("alpha.themes.dashboard").config)

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

require("mini.statusline").setup()

local statusline = require("mini.statusline")
statusline.setup({
	use_icons = vim.g.have_nerd_font,
})

statusline.section_location = function()
	return "%2l:%-2v"
end
