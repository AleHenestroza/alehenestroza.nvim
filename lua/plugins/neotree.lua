require("neo-tree").setup({
	filesystem = {
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
})

vim.keymap.set("n", "\\", "<cmd>Neotree reveal<CR>", {
	desc = "NeoTree reveal",
	silent = true,
})
