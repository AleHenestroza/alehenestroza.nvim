if vim.fn.has("win32") == 0 and vim.fn.executable("make") == 1 then
	vim.fn.system({
		"make",
		"install_jsregexp",
		"-C",
		vim.fn.stdpath("data") .. "/site/pack/core/opt/L3MON4D3-LuaSnip",
	})
end

require("luasnip").setup({})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets" },
	},

	snippets = {
		preset = "luasnip",
	},

	fuzzy = {
		implementation = "lua",
	},

	signature = {
		enabled = true,
	},
})
