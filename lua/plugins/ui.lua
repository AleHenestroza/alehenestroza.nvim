require("which-key").setup({
	delay = 0,
	icons = {
		mappings = vim.g.have_nerd_font,
	},
	spec = {
		{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		{ "gr", group = "LSP Actions", mode = { "n" } },
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
	transparent_background = true,
	auto_integrations = true,
})

vim.cmd.colorscheme("catppuccin-macchiato")

require("todo-comments").setup({
	signs = false,
})

require("mini.ai").setup({
	n_lines = 500,
})

require("mini.surround").setup()

local statusline = require("mini.statusline")
statusline.setup({
	use_icons = vim.g.have_nerd_font,
})

statusline.section_location = function()
	return "%2l:%-2v"
end
